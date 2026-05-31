# sr — one-file scripts, any runtime

> **Home: [originaljt.com](https://originaljt.com)** &nbsp;·&nbsp; [Docs](https://originaljt.com/docs/installation/) &nbsp;·&nbsp; [Pricing](https://originaljt.com/pricing/) &nbsp;·&nbsp; [Downloads](https://github.com/Original-JT/sr-release/releases)

**`sr`** runs self-contained scripts across **15 runtimes** with inline dependency metadata. No `package.json`. No `requirements.txt`. No `go.mod`. No project files. Just a single script that knows what it needs.

```typescript
#!/usr/bin/env sr
/* sr
runtime: node
dep:
  chalk ^5
  zod ^3
*/

import chalk from "chalk";
console.log(chalk.green("Hello from sr!"));
```

```
$ sr hello.ts
Hello from sr!
```

That's it. Dependencies installed into a shared cache. Runtimes auto-installed via [mise](https://mise.jdx.dev/). Same script, three machines, identical behavior.

## Supported runtimes

| Language | Runtimes |
|---|---|
| TypeScript / JavaScript | Node, Deno, Bun |
| Python | python (uv) |
| Ruby | ruby |
| Go | go (run) |
| Haskell | runghc |
| Julia | julia |
| Shell | Bash, Zsh, Fish, Nushell, Dash |
| PowerShell | pwsh (7+), powershell (Windows 5.1) |

## Install

`sr` ships as a single self-contained binary — no prerequisites. On first run it bootstraps `mise`, which then provisions any runtime your script asks for.

### macOS (Apple Silicon) and Linux (x86_64)

```bash
curl -fsSL https://originaljt.com/install.sh | sh
```

### Windows (x86_64)

```powershell
iwr -useb https://originaljt.com/install.ps1 | iex
```

The installer detects your platform, resolves the latest release, verifies the SHA-256 checksum, places `sr` at `~/.sr/bin/sr` (or `%USERPROFILE%\.sr\bin\sr.exe`), and adds that directory to your `PATH`. Restart your shell and you're done.

### Updating

Once `sr` is installed, run:

```bash
sr upgrade            # download and install the latest release if newer
sr upgrade --check    # report availability only; don't download
sr upgrade --force    # re-install the latest release even when already up to date
```

`sr upgrade` fetches the latest build from this repo, verifies its SHA-256 against the published `SHA256SUMS`, and atomically replaces `~/.sr/bin/sr`. Your cache, config, and global shims are preserved.

### Pinning a specific version

```bash
curl -fsSL https://originaljt.com/install.sh | SR_VERSION=YYYYMMDD-shortsha sh
```

```powershell
$env:SR_VERSION = "YYYYMMDD-shortsha"; iwr -useb https://originaljt.com/install.ps1 | iex
```

### Manual download

Prefer to grab a binary directly? Every build is published at **[github.com/Original-JT/sr-release/releases](https://github.com/Original-JT/sr-release/releases)** with archives for macOS (Apple Silicon), Linux (x86_64), and Windows (x86_64), plus a `SHA256SUMS` file:

```bash
curl -LO "https://github.com/Original-JT/sr-release/releases/download/$VERSION/SHA256SUMS"
sha256sum -c SHA256SUMS --ignore-missing
```

> On macOS, files downloaded through a browser are tagged with a quarantine attribute, which triggers an "Apple cannot verify" warning on first run. Either remove the quarantine (`xattr -d com.apple.quarantine sr`) or, simpler, use the curl one-liner above — files fetched by `curl` aren't quarantined.

## In 30 seconds

```bash
sr new deploy            # creates deploy.ts with a metadata block
sr deploy                # runs it
chmod +x deploy.ts && ./deploy.ts   # or, via the shebang
sr deploy -- --flag x    # forward args after --
```

Want a different runtime? `sr new deploy --python`, `--bun`, `--go`, `--ruby`, `--bash`, etc.

## Why sr

- **One file is the project.** No scaffolding, no lockfile sprawl. The script declares what it needs in a comment block at the top.
- **Real dependencies.** `chalk`, `requests`, `nokogiri`, `cobra` — pull from npm, PyPI, RubyGems, the Go module proxy. Private registries (AWS CodeArtifact, Azure Artifacts, GCP Artifact Registry, custom feeds) are first-class.
- **Reproducible.** Cache keyed by script path + content hash. Same inputs → same install.
- **No global pollution.** Runtimes and packages live under `~/.sr/`. Uninstall = delete one directory.
- **Editable.** `sr edit script.ts` opens the script in your IDE with the cache wired in for autocomplete and type-checking.
- **Cross-platform.** macOS (Apple Silicon), Linux (x86_64), Windows (x86_64).

## Documentation

Full guides, command reference, and configuration docs live at **[originaljt.com/docs](https://originaljt.com/docs/installation/)**.

## Pricing & licensing

`sr` is **free for personal, non-commercial use** — the full tool, all 15 runtimes, all future updates, no time limit. Commercial use is a one-time purchase: no subscriptions, no license keys, no activation. Your receipt is your license.

| Tier | Price | Use |
|---|---|---|
| **Personal** | Free | Non-commercial — side projects, learning, OSS contributions |
| **Individual** | $19 one-time | One person, commercial use |
| **Team** | $199 one-time | Up to 15 people, commercial use |
| **Enterprise** | Contact us | 16+ people |

Commercial licenses are coming soon — see **[originaljt.com/pricing](https://originaljt.com/pricing/)** for current status, FAQ, and the "notify me" link.

The `LICENSE` file bundled in each release archive is the binding agreement. Open-source dependency licenses are bundled in `LICENSES.md` alongside it. Redistribution, sublicensing, reverse engineering, and use as a hosted service for third parties are **not** permitted without a separate agreement.

For enterprise pricing or custom agreements, contact the address listed at [originaljt.com](https://originaljt.com).

---

_`sr` is built and maintained by Original JT LLC. Visit **[originaljt.com](https://originaljt.com)** for everything else. Issues filed here are public; please don't include account info or other sensitive data in bug reports._
