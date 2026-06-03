# sr — one-file scripts, any runtime

> **Home: [originaljt.com](https://originaljt.com)** &nbsp;·&nbsp; [Docs](https://originaljt.com/docs/installation/) &nbsp;·&nbsp; [Pricing](https://originaljt.com/pricing/) &nbsp;·&nbsp; [Downloads](https://github.com/Original-JT/sr-release/releases)

`sr` runs self-contained scripts with their runtime and dependencies declared inline — no `package.json`, no `requirements.txt`, no project files. This repository hosts the release binaries; **everything else — guides, command reference, configuration, pricing — lives at [originaljt.com](https://originaljt.com).**

## Install

### macOS (Apple Silicon) and Linux (x86_64)

```bash
curl -fsSL https://originaljt.com/install.sh | sh
```

### Windows (x86_64)

```powershell
iwr -useb https://originaljt.com/install.ps1 | iex
```

The installer detects your platform, resolves the latest release, verifies its SHA-256 checksum, places `sr` at `~/.sr/bin/sr` (or `%USERPROFILE%\.sr\bin\sr.exe`), and adds that directory to your `PATH`. Restart your shell and you're done. Update later with `sr upgrade`.

## Verify & manual download

Every build is published at **[github.com/Original-JT/sr-release/releases](https://github.com/Original-JT/sr-release/releases)** with archives for macOS (Apple Silicon), Linux (x86_64), and Windows (x86_64), plus a `SHA256SUMS` file:

```bash
curl -LO "https://github.com/Original-JT/sr-release/releases/download/$VERSION/SHA256SUMS"
sha256sum -c SHA256SUMS --ignore-missing
```

Pin a specific version with `SR_VERSION`:

```bash
curl -fsSL https://originaljt.com/install.sh | SR_VERSION=YYYYMMDD-shortsha sh
```

```powershell
$env:SR_VERSION = "YYYYMMDD-shortsha"; iwr -useb https://originaljt.com/install.ps1 | iex
```

> On macOS, files downloaded through a browser are tagged with a quarantine attribute, which triggers an "Apple cannot verify" warning on first run. Either remove the quarantine (`xattr -d com.apple.quarantine sr`) or, simpler, use the curl one-liner above — files fetched by `curl` aren't quarantined.

---

_`sr` is built and maintained by Original JT LLC. Full documentation and pricing live at **[originaljt.com](https://originaljt.com)**. Issues filed here are public; please don't include account info or other sensitive data in bug reports._
