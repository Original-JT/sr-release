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

Releases are published here. Download the archive for your platform, extract, and put `sr` on your `PATH`.

### macOS (Apple Silicon)

```bash
LATEST=$(curl -s https://api.github.com/repos/Original-JT/sr-release/releases/latest \
  | sed -n 's/.*"tag_name": *"\([^"]*\)".*/\1/p')
curl -L "https://github.com/Original-JT/sr-release/releases/download/$LATEST/sr-$LATEST-aarch64-apple-darwin.tar.gz" \
  | tar -xz
sudo mv "sr-$LATEST-aarch64-apple-darwin/sr" /usr/local/bin/
```

### Linux (x86_64)

```bash
LATEST=$(curl -s https://api.github.com/repos/Original-JT/sr-release/releases/latest \
  | sed -n 's/.*"tag_name": *"\([^"]*\)".*/\1/p')
curl -L "https://github.com/Original-JT/sr-release/releases/download/$LATEST/sr-$LATEST-x86_64-unknown-linux-musl.tar.gz" \
  | tar -xz
sudo mv "sr-$LATEST-x86_64-unknown-linux-musl/sr" /usr/local/bin/
```

### Windows (x86_64)

```powershell
$Latest = (Invoke-RestMethod https://api.github.com/repos/Original-JT/sr-release/releases/latest).tag_name
$Asset  = "sr-$Latest-x86_64-pc-windows-msvc.zip"
Invoke-WebRequest -Uri "https://github.com/Original-JT/sr-release/releases/download/$Latest/$Asset" -OutFile $Asset
Expand-Archive $Asset -DestinationPath .
Move-Item ".\sr-$Latest-x86_64-pc-windows-msvc\sr.exe" "$env:USERPROFILE\bin\sr.exe"
```

After install, `sr init` will set up `~/.sr/` and add `~/.sr/bin/` to your `PATH`.

### Verify the download

Each release publishes a `SHA256SUMS` file alongside the archives:

```bash
curl -LO "https://github.com/Original-JT/sr-release/releases/download/$LATEST/SHA256SUMS"
sha256sum -c SHA256SUMS --ignore-missing
```

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
