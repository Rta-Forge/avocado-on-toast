# avocado-on-toast

Public **binary distribution** for Avocado — local state-space model inference.

Avocado is a lightweight inference runner with OpenAI/Ollama-compatible APIs. This repository ships **compiled binaries only**. Engine source is not published here.

> An avocado a day keeps the credit card bills away.

---

## Community vs Sovereign

| | **Community** (this repo) | **Sovereign** (private pipeline) |
|---|---------------------------|----------------------------------|
| **What** | Prebuilt binaries + install docs | Optimized builds for internal & partner use |
| **Backends** | Standard Mamba, S4, RWKV, generic GPU paths | Full monorepo build with proprietary optimizations |
| **Source** | Not distributed | Private monorepo only |
| **License** | [Binary License](LICENSE) | Separate written agreement |

Think of it like GPU drivers: you get the binary that runs on your machine; the implementation stays with the vendor.

---

## Intended use

| Tier | Audience | Build |
|------|----------|-------|
| Personal / hobby | Your laptop or workstation | Community binary |
| Small team / lab | Few users, own hardware | Community binary |
| Production / OEM / fieldable | Enterprise or partner deployment | Sovereign — contact RtaForge |

---

## What is in this repo

| Included | Not included |
|----------|--------------|
| Release binaries (GitHub Releases) | Engine source code |
| Install scripts & checksums | Model weights |
| README & license | Sovereign / enterprise builds |
| Release notes | Training tooling |

---

## Install

```bash
# Example — replace VERSION when a release exists
curl -fsSL https://github.com/Rta-Forge/avocado-on-toast/releases/download/v0.1.0/install.sh | bash
```

Releases will be published here soon. For now, you can download from [Releases](https://github.com/Rta-Forge/avocado-on-toast/releases), verify `SHA256SUMS`, unpack:

```bash
tar -xzf avocado-linux-amd64-v0.1.0.tar.gz
./avocado-server --help
```

## Binaries

| Binary | Purpose |
|--------|---------|
| `avocado` | Universal CLI (chat, run, plan) |
| `avocado-server` | HTTP server (OpenAI + Ollama-compatible API) |
| `pavement` | Model crusher (Safetensors -> .splat) |


| OS | Arch | Status |
|----|------|--------|
| Linux | x86_64 | Primary |
| Linux | aarch64 | Planned |
| macOS | arm64 | Planned |

## Verify downloads

```bash
sha256sum -c SHA256SUMS
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

We are not building a community-driven project. We are building a sovereign inference stack. Those are different things, and we are honest about which one this is.

## License

Use of Community binaries is governed by the [Avocado Binary License](LICENSE) (proprietary, binary-only).

Sovereign builds require a separate agreement. See [NOTICE](NOTICE) for third-party attributions in release artifacts.

## Support

Public issues: download, install, and checksum problems only.

Enterprise / Sovereign licensing: contact Guha Kashyap (guha@rtaforge.in) directly.
