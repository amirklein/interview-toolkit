#!/usr/bin/env bash
set -e

# interview-toolkit installer
# Copies all five skills into the right local directories for Claude Code and/or Cursor.

SKILLS=("profile-builder" "thought-partner" "assignment-framing" "assignment-evaluator" "prototype-builder")
REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "interview-toolkit installer"
echo "Repo location: $REPO_DIR"
echo ""
echo "Where do you want to install these skills?"
echo "  1) Claude Code - all projects (~/.claude/skills)"
echo "  2) Claude Code - this project only (./.claude/skills)"
echo "  3) Cursor - all projects (~/.cursor/skills)"
echo "  4) Cursor - this project only (./.cursor/skills)"
echo "  5) Both Claude Code AND Cursor - all projects"
echo ""
read -p "Enter a number (1-5): " choice

install_to() {
  local target_dir="$1"
  mkdir -p "$target_dir"
  for skill in "${SKILLS[@]}"; do
    if [ -d "$REPO_DIR/$skill" ]; then
      cp -r "$REPO_DIR/$skill" "$target_dir/"
      echo "  Installed $skill -> $target_dir/$skill"
    else
      echo "  Skipping $skill - not found in repo at $REPO_DIR/$skill"
    fi
  done
}

case "$choice" in
  1)
    install_to "$HOME/.claude/skills"
    ;;
  2)
    install_to "$(pwd)/.claude/skills"
    ;;
  3)
    install_to "$HOME/.cursor/skills"
    ;;
  4)
    install_to "$(pwd)/.cursor/skills"
    ;;
  5)
    install_to "$HOME/.claude/skills"
    install_to "$HOME/.cursor/skills"
    ;;
  *)
    echo "Not a valid choice (1-5). Nothing installed."
    exit 1
    ;;
esac

echo ""
echo "Done. Restart Claude Code or Cursor (a fresh window/session, not just a new chat) and type / to confirm the skills show up."
echo "Run /profile-builder first to calibrate the rest to your own gaps."
echo ""
echo "Note: if this folder is also a git repo you cloned, your personalized SKILL.md edits"
echo "could show up as changes git wants to commit. To stop git from tracking local edits"
echo "to these files (so /profile-builder's changes never get staged or pushed), run:"
echo ""
for skill in "${SKILLS[@]}"; do
  echo "  git update-index --skip-worktree \"$skill/SKILL.md\""
done
echo ""
echo "This is optional but recommended if you're using Cursor or Claude Code inside a git-tracked clone."
