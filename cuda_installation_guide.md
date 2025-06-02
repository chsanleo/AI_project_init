# 🔧 Installing CUDA and NVIDIA Drivers for PyTorch (Windows)

## ✅ Step 1: Check Your GPU Compatibility

Make sure your computer has a compatible **NVIDIA GPU**.

- Press `Win + X` → Open **Device Manager**
- Expand **Display adapters** and check your GPU model.

You can also run this in PowerShell:

```powershell
Get-WmiObject win32_VideoController | Select-Object Name
```

---

## 🧰 Step 2: Install NVIDIA GPU Driver

1. Visit: [NVIDIA Driver Downloads](https://www.nvidia.com/Download/index.aspx)
2. Select your GPU model and operating system.
3. Download and install the latest **Game Ready** or **Studio** driver.

After installation, **restart your computer**.

To verify installation:

```powershell
nvidia-smi
```

You should see your GPU model, driver version, and CUDA version.

---

## 🚀 Step 3: Install CUDA Toolkit (Optional)

> PyTorch already includes CUDA runtimes, so **you don't strictly need to install the full CUDA Toolkit**, unless you're compiling CUDA code manually.

Still, if you want the toolkit for development:

1. Go to: [CUDA Downloads](https://developer.nvidia.com/cuda-downloads)
2. Select:
   - Operating System: `Windows`
   - Version: choose the same as supported by the PyTorch version you want (e.g., CUDA 11.8)
3. Download the **Network Installer** or **Local Installer**
4. Run the installer and follow the steps.

---

## 🧪 Step 4: Install PyTorch with CUDA Support

After activating your Python virtual environment, install PyTorch with GPU support:

For **CUDA 11.8**:
```bash
pip install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cu118
```

For **CUDA 12.1** (if supported by your GPU):
```bash
pip install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cu121
```

Check supported versions here: [https://pytorch.org/get-started/locally/](https://pytorch.org/get-started/locally/)

---

## 📦 Step 5: Verify GPU Support in PyTorch

Run this Python snippet:

```python
import torch
print("CUDA available:", torch.cuda.is_available())
print("GPU Name:", torch.cuda.get_device_name(0) if torch.cuda.is_available() else "No GPU")
```

If `CUDA available: True`, you're ready to train deep models on GPU! 🎉
