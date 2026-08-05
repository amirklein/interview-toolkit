#!/usr/bin/env bash
#
# interview-toolkit installer.
#
# Works two ways, because a script piped from curl has no checkout around it:
#
#   curl -fsSL https://raw.githubusercontent.com/amirklein/interview-toolkit/main/install.sh | bash
#   ./install.sh          # from a clone, installs that clone
#
# Skills are discovered by looking for folders containing SKILL.md, so adding a
# skill to the repo is enough to make it installable. Rubrics are seeded to
# ~/.interview-toolkit/rubrics/ and never overwritten, since that is where your
# own edits live.
#
set -euo pipefail

REPO_URL="${INTERVIEW_TOOLKIT_REPO:-https://github.com/amirklein/interview-toolkit.git}"
PREFIX="${INTERVIEW_TOOLKIT_PREFIX:-$HOME/.local/share/interview-toolkit}"
HOME_DIR="${INTERVIEW_TOOLKIT_HOME:-$HOME/.interview-toolkit}"

ASSUME_YES=0
DO_UNINSTALL=0
DO_UPDATE=0
PROJECT_LOCAL=0
TARGETS_ARG=""
DO_DRY_RUN=0
DO_BACKUP=0
BACKUP_ROOT=""
ONBOARD=auto

say() { printf '%s\n' "$*"; }
die() { printf 'error: %s\n' "$*" >&2; exit 1; }

usage() {
  cat <<'EOF'
interview-toolkit installer

Usage: ./install.sh [options]

Options:
  -t, --target LIST   Comma-separated tools: claude, cursor, codex, all
                      Default: every tool detected on this machine.
  -p, --project       Install into the current directory instead of your home
                      directory (./.cursor/skills rather than ~/.cursor/skills).
  -y, --yes           Non-interactive. Use with --target, or accept the detected
                      tools.
      --dry-run       Show what would be installed, replaced, or seeded; change nothing.
      --backup        Move existing toolkit skill folders to a dated backup before replacing them.
      --onboard       Start profile-builder as soon as the install finishes, without asking.
      --no-onboard    Don't offer to start profile-builder.
      --update        Pull the latest version, then reinstall.
      --uninstall     Remove the toolkit's skills from the selected targets.
                      Leaves your profile and rubrics alone.
  -h, --help          Show this.

Examples:
  ./install.sh                          # interactive
  ./install.sh -y                       # install to whatever is detected
  ./install.sh -t cursor,codex -y       # specific tools, no prompts
  ./install.sh -t all -p -y             # all three, into this project
  ./install.sh --dry-run -t codex       # inspect an update before changing files
  ./install.sh --backup --update -t codex -y
  ./install.sh -y --onboard             # install, then go straight into profile-builder
  ./install.sh --uninstall -t cursor    # remove from Cursor

Your profile and rubrics live in ~/.interview-toolkit and are never touched by
--uninstall. Delete that folder yourself if you want them gone.
EOF
}

while [ $# -gt 0 ]; do
  case "$1" in
    -t|--target)   TARGETS_ARG="${2:-}"; shift 2 ;;
    --target=*)    TARGETS_ARG="${1#*=}"; shift ;;
    -p|--project)  PROJECT_LOCAL=1; shift ;;
    -y|--yes)      ASSUME_YES=1; shift ;;
    --dry-run)     DO_DRY_RUN=1; shift ;;
    --backup)      DO_BACKUP=1; shift ;;
    --onboard)     ONBOARD=yes; shift ;;
    --no-onboard)  ONBOARD=no; shift ;;
    --update)      DO_UPDATE=1; shift ;;
    --uninstall)   DO_UNINSTALL=1; shift ;;
    -h|--help)     usage; exit 0 ;;
    *)             die "unknown option: $1 (try --help)" ;;
  esac
done

# ---------------------------------------------------------------- find the source

# A checkout next to this script wins. Otherwise fetch one, which is the path
# taken when the script is piped from curl and BASH_SOURCE points at nothing
# useful.
SOURCE=""
script_dir=""
if [ -n "${BASH_SOURCE[0]:-}" ] && [ -f "${BASH_SOURCE[0]:-}" ]; then
  script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
fi

if [ -n "$script_dir" ] && [ -d "$script_dir/profile-builder" ]; then
  SOURCE="$script_dir"
  if [ "$DO_UPDATE" -eq 1 ]; then
    if [ "$DO_DRY_RUN" -eq 1 ]; then
      # A dry run has to leave the checkout alone too, or "inspect before you
      # change anything" quietly moves you to a new commit first.
      say "Would pull the latest into $SOURCE (skipped for --dry-run)."
    elif [ -d "$SOURCE/.git" ]; then
      say "Updating $SOURCE ..."
      git -C "$SOURCE" pull --ff-only --quiet || say "  could not fast-forward; installing what's here"
    else
      say "Not a git checkout, so there's nothing to pull. Installing what's here."
    fi
  fi
else
  command -v git >/dev/null 2>&1 || die "git not found, and no local checkout to install from."
  if [ -d "$PREFIX/.git" ]; then
    say "Updating $PREFIX ..."
    git -C "$PREFIX" pull --ff-only --quiet
  else
    say "Fetching interview-toolkit into $PREFIX ..."
    mkdir -p "$(dirname "$PREFIX")"
    git clone --depth 1 --quiet "$REPO_URL" "$PREFIX"
  fi
  SOURCE="$PREFIX"
fi

# ---------------------------------------------------------------- discover skills

SKILLS=()
for dir in "$SOURCE"/*/; do
  [ -f "${dir}SKILL.md" ] || continue
  SKILLS+=("$(basename "$dir")")
done
[ "${#SKILLS[@]}" -gt 0 ] || die "no skills found in $SOURCE (expected folders containing SKILL.md)"

# ---------------------------------------------------------------- targets

tool_label() {
  case "$1" in
    claude) printf 'Claude Code' ;;
    cursor) printf 'Cursor' ;;
    codex)  printf 'Codex' ;;
  esac
}

# Where a tool keeps its skills. Project-local installs use the same layout
# under the current directory.
tool_dir() {
  local tool="$1" base
  if [ "$PROJECT_LOCAL" -eq 1 ]; then base="$(pwd)"; else base="$HOME"; fi
  printf '%s/.%s/skills' "$base" "$tool"
}

# A tool counts as present if its config directory exists, whether or not it has
# ever been given a skill.
tool_detected() {
  local tool="$1"
  [ -d "$HOME/.$tool" ]
}

ALL_TOOLS=(claude cursor codex)
DETECTED=()
for t in "${ALL_TOOLS[@]}"; do
  tool_detected "$t" && DETECTED+=("$t")
done

TARGETS=()

parse_targets_arg() {
  local IFS=','
  # shellcheck disable=SC2206
  local requested=($1)
  for r in "${requested[@]}"; do
    case "$r" in
      all) TARGETS=("${ALL_TOOLS[@]}"); return ;;
      claude|cursor|codex) TARGETS+=("$r") ;;
      claude-code) TARGETS+=(claude) ;;
      "") ;;
      *) die "unknown target: $r (expected claude, cursor, codex, or all)" ;;
    esac
  done
}

choose_interactively() {
  local reply
  say "interview-toolkit"
  say "Source: $SOURCE"
  say "Skills: ${SKILLS[*]}"
  say ""
  if [ "${#DETECTED[@]}" -gt 0 ]; then
    local labels=()
    for t in "${DETECTED[@]}"; do labels+=("$(tool_label "$t")"); done
    say "Detected on this machine: ${labels[*]}"
  else
    say "No supported tool detected. You can still pick one below."
  fi
  say ""
  say "Where should the skills go?"
  if [ "${#DETECTED[@]}" -gt 0 ]; then
    say "  1) Everything detected"
  else
    say "  1) All three"
  fi
  say "  2) Claude Code      $(tool_dir claude)"
  say "  3) Cursor           $(tool_dir cursor)"
  say "  4) Codex            $(tool_dir codex)"
  say "  5) This project only, for detected tools"
  say ""

  if [ -r /dev/tty ]; then
    printf 'Enter a number (1-5): '
    reply=""
    read -r reply < /dev/tty || true
  else
    say "No terminal available to read a choice from. Re-run with --yes or --target."
    exit 1
  fi

  case "$reply" in
    1) if [ "${#DETECTED[@]}" -gt 0 ]; then TARGETS=("${DETECTED[@]}"); else TARGETS=("${ALL_TOOLS[@]}"); fi ;;
    2) TARGETS=(claude) ;;
    3) TARGETS=(cursor) ;;
    4) TARGETS=(codex) ;;
    5) PROJECT_LOCAL=1
       if [ "${#DETECTED[@]}" -gt 0 ]; then TARGETS=("${DETECTED[@]}"); else TARGETS=("${ALL_TOOLS[@]}"); fi ;;
    *) die "not a valid choice. Nothing installed." ;;
  esac
}

if [ -n "$TARGETS_ARG" ]; then
  parse_targets_arg "$TARGETS_ARG"
elif [ "$ASSUME_YES" -eq 1 ] || [ "$DO_UNINSTALL" -eq 1 ]; then
  if [ "${#DETECTED[@]}" -eq 0 ]; then
    die "no supported tool detected. Pass --target claude,cursor,codex to pick explicitly."
  fi
  TARGETS=("${DETECTED[@]}")
else
  choose_interactively
fi

# De-duplicate, preserving order.
UNIQUE=()
for t in "${TARGETS[@]}"; do
  case " ${UNIQUE[*]:-} " in *" $t "*) continue ;; esac
  UNIQUE+=("$t")
done
TARGETS=("${UNIQUE[@]}")

# ---------------------------------------------------------------- uninstall

if [ "$DO_UNINSTALL" -eq 1 ]; then
  removed=0
  for tool in "${TARGETS[@]}"; do
    dir="$(tool_dir "$tool")"
    for skill in "${SKILLS[@]}"; do
      if [ -d "$dir/$skill" ]; then
        rm -rf "$dir/$skill"
        say "  removed $dir/$skill"
        removed=$((removed + 1))
      fi
    done
    # Tidy up, but only if we left it empty.
    [ -d "$dir" ] && rmdir "$dir" 2>/dev/null || true
  done
  say ""
  if [ "$removed" -eq 0 ]; then
    say "Nothing to remove for: ${TARGETS[*]}"
  else
    say "Removed $removed skill folder(s)."
  fi
  say "Your profile and rubrics are untouched in $HOME_DIR."
  say "To delete those too:  rm -rf $HOME_DIR"
  exit 0
fi

# ---------------------------------------------------------------- install

install_to() {
  local dir="$1" tool="$2" skill
  if [ "$DO_DRY_RUN" -eq 1 ]; then
    for skill in "${SKILLS[@]}"; do
      if [ -d "$dir/$skill" ]; then
        if [ "$DO_BACKUP" -eq 1 ]; then
          say "  would back up $dir/$skill -> $BACKUP_ROOT/$tool/$skill"
        else
          say "  would replace $dir/$skill"
        fi
      else
        say "  would install $skill -> $dir/$skill"
      fi
    done
    return
  fi

  mkdir -p "$dir"
  for skill in "${SKILLS[@]}"; do
    if [ -d "$dir/$skill" ]; then
      if [ "$DO_BACKUP" -eq 1 ]; then
        mkdir -p "$BACKUP_ROOT/$tool"
        mv "$dir/$skill" "$BACKUP_ROOT/$tool/$skill"
        say "  backed up $dir/$skill -> $BACKUP_ROOT/$tool/$skill"
      else
        rm -rf "$dir/$skill"
      fi
    fi
    cp -R "$SOURCE/$skill" "$dir/$skill"
    say "  $skill -> $dir/$skill"
  done
}

if [ "$DO_BACKUP" -eq 1 ]; then
  BACKUP_ROOT="$HOME_DIR/backups/$(date +%Y%m%d-%H%M%S)"
fi

say ""
for tool in "${TARGETS[@]}"; do
  say "$(tool_label "$tool"):"
  install_to "$(tool_dir "$tool")" "$tool"
done

# ---------------------------------------------------------------- rubrics

# Rubrics are the customization surface, so an existing file always wins. A
# reinstall or an update must never overwrite someone's edited rubric.
seeded=0
skipped=0
if [ -d "$SOURCE/rubrics" ]; then
  [ "$DO_DRY_RUN" -eq 1 ] || mkdir -p "$HOME_DIR/rubrics"
  for f in "$SOURCE"/rubrics/*.md; do
    [ -f "$f" ] || continue
    name="$(basename "$f")"
    if [ -e "$HOME_DIR/rubrics/$name" ]; then
      skipped=$((skipped + 1))
    else
      if [ "$DO_DRY_RUN" -eq 0 ]; then
        cp "$f" "$HOME_DIR/rubrics/$name"
      fi
      seeded=$((seeded + 1))
    fi
  done
fi

say ""
if [ "$DO_DRY_RUN" -eq 1 ]; then
  say "Rubrics in $HOME_DIR/rubrics: $seeded would be added, $skipped left alone (yours)."
else
  say "Rubrics in $HOME_DIR/rubrics: $seeded added, $skipped left alone (yours)."
fi
if [ "$skipped" -gt 0 ]; then
  say "Shipped versions are always in $SOURCE/rubrics if you want to compare."
fi

# ---------------------------------------------------------------- references

# The opposite policy to rubrics: this is toolkit mechanics rather than anything
# personal, so it is refreshed every time. A stale question protocol means the
# skills keep asking the way an older version told them to.
if [ -d "$SOURCE/references" ]; then
  if [ "$DO_DRY_RUN" -eq 1 ]; then
    say "Would refresh $HOME_DIR/references/ (installer-managed)."
  else
    mkdir -p "$HOME_DIR/references"
    cp "$SOURCE"/references/*.md "$HOME_DIR/references/"
    say "References refreshed in $HOME_DIR/references (installer-managed, not yours to keep)."
  fi
fi

# ------------------------------------------------------ codex question support

# Codex only exposes its structured-question tool outside plan mode when this
# feature flag is set, so without it every question in the toolkit degrades to
# typing. It is someone else's config file, so we ask, back it up, and never
# touch a key that already exists.
CODEX_CONFIG="${CODEX_HOME:-$HOME/.codex}/config.toml"

codex_picker_key_present() {
  [ -f "$CODEX_CONFIG" ] &&
    grep -Eq '^[[:space:]]*default_mode_request_user_input[[:space:]]*=' "$CODEX_CONFIG"
}

codex_picker_enabled() {
  [ -f "$CODEX_CONFIG" ] &&
    grep -Eq '^[[:space:]]*default_mode_request_user_input[[:space:]]*=[[:space:]]*true' "$CODEX_CONFIG"
}

enable_codex_picker() {
  mkdir -p "$(dirname "$CODEX_CONFIG")"
  if [ -f "$CODEX_CONFIG" ]; then
    cp "$CODEX_CONFIG" "$CODEX_CONFIG.interview-toolkit-$(date +%Y%m%d-%H%M%S).bak"
  fi
  if [ -f "$CODEX_CONFIG" ] && grep -Eq '^[[:space:]]*\[features\][[:space:]]*$' "$CODEX_CONFIG"; then
    awk '
      /^[[:space:]]*\[features\][[:space:]]*$/ && !inserted {
        print; print "default_mode_request_user_input = true"; inserted = 1; next
      }
      { print }
    ' "$CODEX_CONFIG" > "$CODEX_CONFIG.itk-tmp" && mv "$CODEX_CONFIG.itk-tmp" "$CODEX_CONFIG"
  else
    printf '\n[features]\ndefault_mode_request_user_input = true\n' >> "$CODEX_CONFIG"
  fi
}

codex_manual_note() {
  say "  To make the toolkit's questions clickable in Codex, add this to $CODEX_CONFIG:"
  say ""
  say "      [features]"
  say "      default_mode_request_user_input = true"
  say ""
}

if [ "$DO_DRY_RUN" -eq 0 ] && printf '%s\n' "${TARGETS[@]}" | grep -qx codex; then
  say ""
  if codex_picker_enabled; then
    say "Codex: click-to-select questions already enabled."
  elif codex_picker_key_present; then
    say "Codex: default_mode_request_user_input is set to something other than true in"
    say "$CODEX_CONFIG. Leaving it alone — change it by hand if you want clickable questions."
  else
    say "Codex asks questions as plain text unless one flag is set."
    if [ "$ASSUME_YES" -eq 1 ]; then
      say "Not changing your config in non-interactive mode."
      codex_manual_note
    elif [ -r /dev/tty ]; then
      printf 'Add default_mode_request_user_input = true to %s? [y/N] ' "$CODEX_CONFIG"
      # An EOF here — a closed stdin, or someone pressing Ctrl-D — must not take
      # the whole installer down under `set -e` after the skills are in place.
      codex_reply=""
      read -r codex_reply < /dev/tty || say ""
      case "$codex_reply" in
        y|Y|yes|YES)
          enable_codex_picker
          say "  Done. Existing config backed up alongside it. Restart Codex to pick it up."
          ;;
        *)
          say "  Left alone."
          codex_manual_note
          ;;
      esac
    else
      codex_manual_note
    fi
  fi
fi

# ---------------------------------------------------------------- next steps

say ""
if [ "$DO_DRY_RUN" -eq 1 ]; then
  say "Dry run complete. No files were changed. Re-run without --dry-run to install."
  exit 0
fi

say "Done."

# ------------------------------------------------------------------ onboarding

# A fresh install can hand straight over to profile-builder, so the first thing
# someone sees is the interview rather than an instruction to go find a skill
# name. Only the CLIs can be driven this way: a GUI editor won't see the new
# skills until its window is restarted, and no script can do that for it.
cli_for_tool() {
  case "$1" in
    claude) printf 'claude' ;;
    cursor) printf 'cursor-agent' ;;
    codex)  printf 'codex' ;;
  esac
}

ONBOARD_CLI=""
for tool in "${TARGETS[@]}"; do
  candidate="$(cli_for_tool "$tool")"
  if [ -n "$candidate" ] && command -v "$candidate" >/dev/null 2>&1; then
    ONBOARD_CLI="$candidate"
    break
  fi
done

ONBOARD_PROMPT="Use the profile-builder skill from Interview Toolkit to interview me now and write my profile to $HOME_DIR/profile.md. Follow $HOME_DIR/references/question-protocol.md: ask every enumerable question through your structured-question tool so I can click instead of typing."

have_profile=0
[ -f "$HOME_DIR/profile.md" ] && have_profile=1

want_onboard=0
case "$ONBOARD" in
  yes) want_onboard=1 ;;
  no)  want_onboard=0 ;;
  auto)
    # Don't march someone who already has a profile back through it, and don't
    # ambush a scripted install with an interactive agent it can't answer.
    if [ "$have_profile" -eq 0 ] && [ "$ASSUME_YES" -eq 0 ] &&
       [ -n "$ONBOARD_CLI" ] && [ -r /dev/tty ]; then
      say ""
      say "One thing left: /profile-builder is what makes the rest of this specific to"
      say "you rather than generic. Five to ten minutes, mostly clicking."
      printf 'Start it now in %s? [Y/n] ' "$ONBOARD_CLI"
      # On EOF, don't launch. Handing an interactive agent a stdin that has
      # already closed produces an agent that exits on arrival.
      onboard_reply=""
      if read -r onboard_reply < /dev/tty; then
        case "$onboard_reply" in
          n|N|no|NO) want_onboard=0 ;;
          *) want_onboard=1 ;;
        esac
      else
        say ""
        say "No answer read, so leaving it for later."
      fi
    fi
    ;;
esac

if [ "$want_onboard" -eq 1 ] && [ -z "$ONBOARD_CLI" ]; then
  # Asked for, but nothing to launch. The install itself succeeded, so say what
  # happened and fall through rather than failing a scripted run.
  say ""
  say "Asked to start profile-builder, but no agent CLI is on PATH (looked for"
  say "claude, cursor-agent, codex). Installing only; start it yourself below."
  want_onboard=0
fi

if [ "$want_onboard" -eq 1 ]; then
  say ""
  say "Starting $ONBOARD_CLI. If it asks you to sign in first, do that and then say"
  say "\"run profile-builder\" — the skills are installed either way."
  say ""
  cd "$HOME"
  # Reading from /dev/tty matters when this script arrived through a pipe:
  # stdin is the script itself, and an interactive agent inheriting that is
  # an agent that exits immediately.
  if [ -r /dev/tty ]; then
    exec "$ONBOARD_CLI" "$ONBOARD_PROMPT" < /dev/tty
  else
    exec "$ONBOARD_CLI" "$ONBOARD_PROMPT"
  fi
fi

# ---------------------------------------------------------------- what's next

say ""
say "Two things left:"
say ""
say "  1. Restart your editor or agent — a fresh window, not just a new chat,"
say "     the first time you add a skills directory. Then type / to check that"
say "     the skills are listed."
say "  2. Run /profile-builder. It takes five to ten minutes and it's what makes"
say "     everything else specific to you instead of generic."
say ""
if [ "$have_profile" -eq 0 ]; then
  say "No profile yet at $HOME_DIR/profile.md — /profile-builder writes it."
  if [ -n "$ONBOARD_CLI" ]; then
    say "Or skip the restart entirely:  $ONBOARD_CLI \"run profile-builder\""
  fi
else
  say "Existing profile found at $HOME_DIR/profile.md, left as it is."
fi
