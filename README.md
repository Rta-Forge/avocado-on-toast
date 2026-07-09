# avocado-on-toast

Public **binary distribution** for Avocado — local state-space model inference.

Avocado is a lightweight inference runner with OpenAI/Ollama-compatible APIs. Every platform build is closed and obfuscated (garble, all identifiers/strings scrambled). Engine source is not published here.

> An avocado a day keeps the credit card bills away.

---

## What is in this repo

| Included | Not included |
|----------|--------------|
| Release binaries (GitHub Releases, all 5 platforms) | Engine source code |
| Checksums (`SHA256SUMS`) + GPG signature (`SHA256SUMS.asc`) | Model weights |
| README & license | Training tooling |

There is no separate "sovereign" build or repo. This binary — obfuscated, GPU-accelerated (Vulkan/Metal) — is the only build. Think of it like GPU drivers: you get the binary that runs on your machine; the implementation stays with the vendor.

---

## Install

Download the platform archive for your machine from the [Releases page](https://github.com/Rta-Forge/avocado-on-toast/releases/latest), verify it, and unpack:

```bash
# Linux/macOS
tar -xzf avocado-linux-amd64.tar.gz   # or your platform's archive
sha256sum -c SHA256SUMS               # or: shasum -a 256 -c SHA256SUMS on macOS
gpg --verify SHA256SUMS.asc SHA256SUMS
./avocado-server --help
```

```bash
# pip installer (downloads the right binary on first use)
pip install rtaforge
```

**macOS:** if Gatekeeper blocks the unsigned binary, run `xattr -dr com.apple.quarantine ./avocado`.
**Windows:** SmartScreen may warn on first run — "More info → Run anyway".

## Binaries

| Binary | Purpose |
|--------|---------|
| `avocado` | Universal CLI (chat, run, plan) |
| `avocado-server` | HTTP server (OpenAI + Ollama-compatible API) |
| `avocado-session` | Persistent chat session management |
| `avocado-plan` | Multi-step plan execution |
| `pavement` | Model crusher (Safetensors -> .splat) |

| OS | Arch | Backend |
|----|------|---------|
| Linux | x86_64 | Vulkan |
| Linux | aarch64 | Vulkan |
| macOS | arm64 | Metal |
| macOS | x86_64 | Metal |
| Windows | x86_64 | Vulkan |

## Verify downloads

```bash
sha256sum -c SHA256SUMS
gpg --verify SHA256SUMS.asc SHA256SUMS
```

## Models

Find our pre-crushed models and base weights on Hugging Face: [huggingface.co/RtaForge](https://huggingface.co/RtaForge)

## Quick start

```bash
avocado-server -model <path-to-checkpoint> -addr :8080
```

Point any OpenAI-compatible client at `http://127.0.0.1:8080/v1`.

---

## Transparency

Avocado ships as a binary. The source is not published.

If you need to audit the engine for security, compliance, or integration work — ask. We share source with people who have a legitimate reason to see it. Contact guha@rtaforge.in.

We are not building a community-driven project. We are building a sovereign inference stack, and shipping one honest binary rather than splitting trust into tiers.

## License

Use of these binaries is governed by the [Avocado Binary License](LICENSE) (proprietary, binary-only). See [NOTICE](NOTICE) for third-party attributions in release artifacts.

## Support

Public issues: download, install, and checksum problems only.

Licensing / commercial use: contact Guha Kashyap (guha@rtaforge.in) directly.
