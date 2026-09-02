# homebrew-chronify

Homebrew tap for [Chronify](https://github.com/zepuff/Chronify) — a macOS menu bar work tracker with automatic time logging, local-AI daily statuses and invoicing.

## Install

```bash
brew tap zepuff/chronify
brew trust zepuff/chronify
brew install chronify
```

`brew trust` is Homebrew confirming you're willing to run a formula from outside its official repository. Skipping it stops the install with an "untrusted tap" error.

Requires macOS. The first install takes a couple of minutes — this tap ships no pre-built bottles, so Pillow, lxml and the PyObjC frameworks are compiled from source. Later upgrades are much quicker.

## Run

```bash
chronify
```

To start it automatically at login:

```bash
brew services start chronify
```

macOS asks for two permissions on first launch. **Screen Recording** is what makes window titles readable — without it every entry is logged as a bare app name with no task breakdown. **Notifications** are needed for timed reminders. Both are granted in System Settings → Privacy & Security.

## Optional extras

Neither is required; Chronify works without them.

```bash
brew install ollama && brew services start ollama && ollama pull qwen2.5:3b
brew install --cask libreoffice
```

Ollama writes the daily status as prose instead of a plain list of your notes, and it runs entirely on your Mac. LibreOffice converts finished invoices to PDF — without it the `.docx` is still produced.

## Upgrade

```bash
brew update && brew upgrade chronify
```

macOS ties Screen Recording to the exact binary, so an upgrade clears that permission and it has to be granted again. Chronify says so at launch.

Settings and data in `~/.work_tracker/` are never touched by an upgrade.

## Uninstall

```bash
brew services stop chronify
brew uninstall chronify
brew untap zepuff/chronify
```

Personal data in `~/.work_tracker/` is left untouched by uninstall — remove it by hand if you want it gone.

## License

Chronify is licensed under the GNU General Public License v3 or later. Copyright (C) 2026 Zepuff.