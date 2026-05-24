# Avocado HOWTO: From Raw Weights to Local Inference 🥑🚀

This guide walks you through the "Avocado Workflow": **Crush, Load, and Generate.**

Whether you are using the **Community Edition (Toast)** or the **Sovereign Edition (Prime)**, the steps are the same. Only the math changes.

---

## 1. Installation

### Community Edition
Run the installer directly from GitHub:
```bash
curl -fsSL https://github.com/Rta-Forge/avocado-on-toast/raw/main/install.sh | bash
```

### Sovereign Edition (Prime)
Use the hardened installer provided in your authorized bundle:
```bash
./install_prime.sh
```


---

## 2. Step 1: Crush (The Pavement Tool) 🔨

Avocado doesn't run raw HuggingFace repositories directly. You must first "crush" them into the portable **.splat** format using the `pavement` tool.

### Basic Crushing
To convert a standard Mamba2 model:
```bash
./pavement -src ./path/to/hf/model -out ./my-model.splat -op mamba2
```

```

**What Pavement does:**
- Extracts weights from Safetensors.
- Consolidates them into a single `weights.bin`.
- Generates `metadata.json` and `plugin.json` (the "Splat" descriptors).
- Bundles your `tokenizer.json`.

---

## 3. Step 2: Load (Testing the Plan) 📋

Before you start a long chat session, verify that Avocado can correctly map the model to your hardware.

```bash
./avocado plan -model-dir ./my-model.splat
```

This will print a JSON "Execution Plan" showing:
- Which backend was selected (Vulkan, ROCm, or CPU).
- The memory requirements for the recurrent state.
- The layer mapping across your available GPUs.

---

## 4. Step 3: Generate (Inference) 💬

Now you are ready to run inference. You can use the interactive CLI or start the API server.

### Interactive Chat
```bash
./avocado chat -model-dir ./my-model.splat
```

### Start the API Server (OpenAI Compatible)
```bash
./avocado-server -model-dir ./my-model.splat -addr :8080
```

### Example: Querying via cURL
```bash
curl http://localhost:8080/v1/chat/completions \
  -H "Content-Type: application/json" \
  -d '{
    "messages": [{"role": "user", "content": "How do SSMs handle long context?"}],
    "temperature": 0.7
  }'
```

---

## 5. Hardware Optimization

### AMD Stormcloud (RX 560X / gfx803)
If you are on a "Toaster" with an older AMD GPU, ensure you have the correct overrides:
```bash
export HSA_OVERRIDE_GFX_VERSION=8.0.3
export NAKSHATRA_USE_GPU=1
```

```

---

## 6. Support & Licensing

- **Community Support**: Open an issue on [avocado-on-toast](https://github.com/Rta-Forge/avocado-on-toast/issues) for install/checksum bugs.
- **Sovereign Support**: Contact **Guha Kashyap (guha@rtaforge.in)** for architecture deep-dives and production licenses.

---
*"Avocado, meet Pavement. Local inference is now Sovereign."* 🥑🛡️
