# sr — one-file scripts, any runtime

**`sr`** runs self-contained scripts across **13 runtimes** with inline dependency metadata. No `package.json`. No `requirements.txt`. No `go.mod`. No project files. Just a single script that knows what it needs.

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

The installer detects your platform, resolves the latest release, verifies the SHA-256 checksum, and places `sr` at `~/.sr/bin/sr` (or `%USERPROFILE%\.sr\bin\sr.exe`). Then run:

```bash
sr init
```

to add `~/.sr/bin/` to your `PATH`.

### Pinning a specific version

```bash
curl -fsSL https://originaljt.com/install.sh | SR_VERSION=YYYYMMDD-shortsha sh
```

```powershell
$env:SR_VERSION = "YYYYMMDD-shortsha"; iwr -useb https://originaljt.com/install.ps1 | iex
```

### Manual download (advanced)

If you'd rather not pipe a script to your shell, [browse releases](https://github.com/Original-JT/sr-release/releases) and download the archive for your target. Each release also publishes a `SHA256SUMS` file:

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

## Documentation & purchase

Full docs, guides, and licensing live at **[originaljt.com](https://originaljt.com)**.

## License

`sr` is **commercial software**. The included `LICENSE` file is the binding agreement; the summary below is informational only.

- Per-user license, paid.
- A free evaluation period is available for prospective buyers.
- Redistribution, sublicensing, reverse engineering, and use as a hosted service for third parties are **not** permitted without a separate agreement.
- Open-source dependency licenses are bundled in `LICENSES.md` inside every release archive.

For licensing questions or volume / team agreements, contact the address listed at [originaljt.com](https://originaljt.com).

---

_`sr` is built and maintained by Original JT LLC. Issues filed here are public; please don't include license keys, account info, or other sensitive data in bug reports._
