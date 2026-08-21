# homebrew-chronify

Homebrew tap for [Chronify](https://github.com/zepuff/Chronify) — a macOS menu bar work tracker with automatic time logging, local-AI daily statuses and invoicing.

## Install

```bash
brew tap zepuff/chronify
brew trust zepuff/chronify
brew install chronify
```

`brew trust` is Homebrew confirming you're willing to run a formula from outside its official repository. Skipping it stops the install with an "untrusted tap" error.

Requires macOS. The first install takes a few minutes — this tap ships no pre-built bottles, so Pillow and the PyObjC frameworks are compiled from source.

## Run

```bash
chronify
```

To start it automatically at login:

```bash
brew services start chronify
```

## Upgrade

```bash
brew update && brew upgrade chronify
```

## Uninstall

```bash
brew services stop chronify
brew uninstall chronify
brew untap zepuff/chronify
```

Personal data in `~/.work_tracker/` is left untouched by uninstall — remove it by hand if you want it gone.

## License

Chronify is licensed under the GNU General Public License v3 or later. Copyright (C) 2026 Zepuff.