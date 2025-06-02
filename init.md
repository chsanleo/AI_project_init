# Environment Setup Instructions

## How to run the setup script

1. Open PowerShell in the project directory.

2. If you get an error about script execution being disabled, run PowerShell as Administrator and execute:

```powershell
Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy Bypass
```

3. To run the setup script, use:

```powershell
.\setup_env.ps1
```
This script will:

- Create the necessary project folders (data/, src/, notebooks/).

- Create and activate a Python virtual environment (.venv).

- Install dependencies from requirements.txt if it exists, replacing PyTorch with the CPU-only version if cuda is not install.

- If requirements.txt is not found, it will install solo-learn and PyTorch CPU-only manually if cuda is not install.

- Register the environment as a Jupyter kernel called `env`.

## How to select the kernel in VSCode Jupyter notebooks

1. Open your Jupyter notebook (.ipynb) in VSCode.

2. Click on the kernel selector on the top-right (or use the command palette: Python: Select Interpreter to start Jupyter Notebook).

3. Select the kernel named `env`.

4. If you don't see the kernel, try restarting VSCode or your computer.

## Verify installation in a notebook

Create a new code cell in your notebook with this code and run it:

```python
import torch
import solo_learn

print(f"PyTorch version: {torch.__version__}")
print(f"CUDA available: {torch.cuda.is_available()}")
print("solo-learn imported successfully")
```

If this runs without errors and shows CUDA as False, your environment is correctly set up with CPU-only PyTorch.

If you encounter any issues, make sure your Python and pip versions are up to date, and that you have internet access to download packages.