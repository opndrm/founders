# Apple Emoji Playground Connection

Use this reference when Crew needs native Apple custom emoji for the Agent
Rewards system.

## The two representations

- **Native Apple glyph:** Image Playground with Emoji style produces an
  `NSAdaptiveImageGlyph`, the format used by Genmoji. It belongs in a macOS
  app's rich-text experience.
- **Buzz palette asset:** Buzz registers a square image from a stable URL by
  shortcode. It is a separate PNG fallback, not the native glyph object.

## Minimal product flow

1. Codex prepares a short emblem prompt and reward metadata.
2. An owner opens the Crew macOS creator and uses Apple's Image Playground
   Emoji mode.
3. The app receives the glyph through Apple's completion path and preserves it
   with the reward record.
4. The owner approves a square PNG fallback for Buzz.
5. Crew registers the fallback under a stable shortcode and logs the approved
   milestone reward.

## Constraints

- Apple generation is interactive and availability depends on Apple
  Intelligence support; it must not be represented as headless automation.
- Agent Rewards is a symbolic emoji palette, not a financial asset, balance, or
  transferable score.
- The verified milestone record is authoritative. Agent names do not display
  balances.

## Official references

- Apple Image Playground Emoji style and adaptive image glyph completion:
  https://developer.apple.com/videos/play/wwdc2026/375/
- Apple Genmoji support and glyph behavior:
  https://developer.apple.com/videos/play/wwdc2024/10220/
