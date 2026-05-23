# Security Policy

`sr` is distributed as a single binary that you install with `curl … | sh` and
that bootstraps other tools on your machine. We take its integrity seriously.

## Reporting a vulnerability

**Please report security issues privately. Do not open a public issue.**

Two ways, either is fine:

1. **GitHub private advisory (preferred).** Use the
   [**Report a vulnerability**](https://github.com/Original-JT/sr-release/security/advisories/new)
   button on this repo's Security tab. This opens a private channel only you and
   the maintainers can see.
2. **Email.** Write to **security@originaljt.com**. If you'd like to encrypt the
   report, say so and we'll arrange a key.

Please include enough to reproduce: the `sr --version` output, your platform,
and the steps or proof-of-concept. If the issue involves private-registry auth,
**redact any real tokens or credentials** — a description of the flow is enough.

## What to expect

- We aim to acknowledge a report within **3 business days**.
- We'll confirm the issue, work on a fix, and keep you updated on progress.
- Once a fix ships, we're happy to credit you in the release notes — tell us how
  you'd like to be named, or if you'd rather stay anonymous.

Please give us a reasonable window to ship a fix before any public disclosure.

## Supported versions

`sr` releases roll forward. Security fixes land in the **latest release** only;
there are no maintained back-branches. Run `sr upgrade` to stay current. The
latest build is always at
[github.com/Original-JT/sr-release/releases](https://github.com/Original-JT/sr-release/releases).

## Verifying your download

Every release publishes a `SHA256SUMS` file. The `curl … | sh` installer and
`sr upgrade` both verify the SHA-256 checksum against it before installing. If
you download a binary manually, verify it yourself:

```bash
curl -LO "https://github.com/Original-JT/sr-release/releases/download/$VERSION/SHA256SUMS"
sha256sum -c SHA256SUMS --ignore-missing
```

A checksum mismatch means **do not run the binary** — report it to the address
above.
