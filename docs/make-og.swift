// Renders docs/og.png, the 1200x630 card that link previews show.
//
//   swift docs/make-og.swift
//
// Checked in so the image can be regenerated after a copy change rather than
// being an opaque binary nobody can edit. Needs macOS; there are no dependencies
// beyond AppKit.

import AppKit

let width = 1200.0
let height = 630.0
let outPath = FileManager.default.currentDirectoryPath + "/docs/og.png"

// Same palette as index.html.
let bg = NSColor(srgbRed: 0.980, green: 0.976, blue: 0.969, alpha: 1)
let ink = NSColor(srgbRed: 0.086, green: 0.082, blue: 0.102, alpha: 1)
let faint = NSColor(srgbRed: 0.553, green: 0.545, blue: 0.584, alpha: 1)
let muted = NSColor(srgbRed: 0.388, green: 0.380, blue: 0.420, alpha: 1)
let accent = NSColor(srgbRed: 0.122, green: 0.435, blue: 0.922, alpha: 1)

guard let rep = NSBitmapImageRep(
    bitmapDataPlanes: nil,
    pixelsWide: Int(width), pixelsHigh: Int(height),
    bitsPerSample: 8, samplesPerPixel: 4,
    hasAlpha: true, isPlanar: false,
    colorSpaceName: .deviceRGB, bytesPerRow: 0, bitsPerPixel: 0
) else { fatalError("could not create bitmap") }

NSGraphicsContext.saveGraphicsState()
NSGraphicsContext.current = NSGraphicsContext(bitmapImageRep: rep)

// Background.
bg.setFill()
NSRect(x: 0, y: 0, width: width, height: height).fill()

// Hairline frame, so the card has an edge on white backgrounds too.
NSColor(srgbRed: 0.894, green: 0.882, blue: 0.863, alpha: 1).setStroke()
let frame = NSBezierPath(rect: NSRect(x: 0.5, y: 0.5, width: width - 1, height: height - 1))
frame.lineWidth = 1
frame.stroke()

let margin = 84.0

func draw(_ text: String, x: CGFloat, y: CGFloat, font: NSFont, color: NSColor) {
    let attrs: [NSAttributedString.Key: Any] = [.font: font, .foregroundColor: color]
    NSAttributedString(string: text, attributes: attrs).draw(at: NSPoint(x: x, y: y))
}

// ---------------------------------------------------------------- logo mark

let markSize = 46.0
let markY = height - margin - markSize
let markRect = NSRect(x: margin, y: markY, width: markSize, height: markSize)
ink.setFill()
NSBezierPath(roundedRect: markRect, xRadius: 11, yRadius: 11).fill()

// The checkmark, drawn in the mark's own coordinates.
let check = NSBezierPath()
check.move(to: NSPoint(x: markRect.minX + 12.5, y: markRect.minY + 24.0))
check.line(to: NSPoint(x: markRect.minX + 19.0, y: markRect.minY + 17.5))
check.line(to: NSPoint(x: markRect.minX + 33.5, y: markRect.minY + 32.0))
check.lineWidth = 4.4
check.lineCapStyle = .round
check.lineJoinStyle = .round
NSColor.white.setStroke()
check.stroke()

draw("INTERVIEW TOOLKIT",
     x: margin + markSize + 18, y: markY + 12,
     font: NSFont.systemFont(ofSize: 21, weight: .semibold),
     color: ink)

// ---------------------------------------------------------------- headline

let headline = NSFont.systemFont(ofSize: 72, weight: .semibold)
draw("You already have", x: margin, y: 352, font: headline, color: ink)
draw("the skillset.", x: margin, y: 262, font: headline, color: ink)
draw("The assignment has to show it.", x: margin, y: 186,
     font: NSFont.systemFont(ofSize: 40, weight: .regular), color: faint)

// Accent rule under the headline block.
accent.setFill()
NSBezierPath(roundedRect: NSRect(x: margin, y: 152, width: 88, height: 5),
             xRadius: 2.5, yRadius: 2.5).fill()

// ---------------------------------------------------------------- skill list

// The right third would otherwise be dead space, and the skill names say more
// about what this is than any abstract shape would.
let mono = NSFont.monospacedSystemFont(ofSize: 19, weight: .medium)
let skills = [
    "/profile-builder",
    "/assignment-framing",
    "/thought-partner",
    "/prototype-builder",
    "/assignment-evaluator",
    "/assignment-defense",
]
let listX = 776.0
var listY = 366.0
for name in skills {
    accent.setFill()
    NSBezierPath(ovalIn: NSRect(x: listX, y: listY + 8, width: 5, height: 5)).fill()
    draw(name, x: listX + 16, y: listY, font: mono, color: muted)
    listY -= 34
}

// ---------------------------------------------------------------- footer line

draw("claude code  ·  cursor  ·  codex  ·  free and open source",
     x: margin, y: margin - 12, font: mono, color: faint)

NSGraphicsContext.restoreGraphicsState()

guard let png = rep.representation(using: .png, properties: [:]) else {
    fatalError("could not encode png")
}
try png.write(to: URL(fileURLWithPath: outPath))
print("wrote \(outPath)")
