# AI Project Starter Template

This is an initialization project designed to serve as a foundation for building AI projects in Python.

The setup is primarily tailored for **Windows** with **Visual Studio Code**, but can be easily adapted for **Linux** by replacing the commands in the script with their Linux equivalents.

## Project Setup Steps

1. Follow the instructions in `cuda_installation_guide.md` to set up CUDA and GPU drivers (optional, only for GPU-enabled development).
2. Review the `init.md` file for environment setup instructions and PowerShell execution policy workarounds.
3. Run the `setup_env.ps1` script using **PowerShell as Administrator** to automatically create the folder structure, set up the virtual environment, install dependencies, and configure Jupyter integration.
4. Run `test_imports.py` to verify that all core modules and dependencies are correctly installed and working.

## Important Notes

- **Avoid using WSL (Windows Subsystem for Linux)**: When mounting paths through `/mnt`, virtual environments may not be properly created or recognized. For this reason, it's recommended to run the setup script via PowerShell in **Administrator mode** on native Windows.