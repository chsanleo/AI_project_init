# setup_env.ps1

# Function to create folders if missing
function Create-Folders {
    param([string[]]$folders)
    foreach ($folder in $folders) {
        if (-Not (Test-Path $folder)) {
            Write-Host "Creating folder: $folder"
            New-Item -ItemType Directory -Path $folder | Out-Null
        }
    }
}

# Create necessary folders
Create-Folders -folders @("data", "src", "notebooks")

# Check if virtual environment folder exists
if (-Not (Test-Path ".venv")) {
    Write-Host "Creating Python virtual environment in .venv..."
    python -m venv .venv
} else {
    Write-Host "Virtual environment already exists."
}

# Activate virtual environment
# This activates the virtual environment for this PowerShell session
Write-Host "Activating virtual environment..."
& .\.venv\Scripts\Activate.ps1

# Upgrade pip
Write-Host "Upgrading pip..."
python -m pip install --upgrade pip

# Install dependencies from requirements.txt if exists
if (Test-Path "requirements.txt") {
    Write-Host "Installing dependencies from requirements.txt..."
    python -m pip install -r requirements.txt
} else {
    Write-Host "No requirements.txt found. Skipping."
}

# Check if torch is installed and detect GPU support
$checkCudaScript = @"
try:
    import torch
    print('GPU' if torch.cuda.is_available() else 'CPU')
except ImportError:
    print('NOT_INSTALLED')
"@

$gpuCheck = python -c $checkCudaScript 2>$null

if ($gpuCheck -eq "NOT_INSTALLED") {
    Write-Host "PyTorch not installed. Detecting GPU availability to install correct version..."
    # We'll attempt to detect CUDA presence via nvidia-smi if available
    $nvidiaSmi = Get-Command nvidia-smi -ErrorAction SilentlyContinue
    if ($null -ne $nvidiaSmi) {
        Write-Host "NVIDIA GPU detected (nvidia-smi found). Installing PyTorch with CUDA support..."
        # Install latest stable PyTorch with CUDA 11.8 support (adjust if needed)
        python -m pip install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cu118
    } else {
        Write-Host "No NVIDIA GPU detected. Installing CPU-only PyTorch..."
        python -m pip install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cpu
    }
} elseif ($gpuCheck -eq "GPU") {
    Write-Host "PyTorch is installed and GPU is available."
} elseif ($gpuCheck -eq "CPU") {
    Write-Host "PyTorch is installed but GPU not available."
} else {
    Write-Host "Unknown PyTorch status: $gpuCheck"
}

# Register the environment as a Jupyter kernel
Write-Host "Registering the virtual environment as a Jupyter kernel..."
python -m ipykernel install --user --name=project_env --display-name "Python (project_env)"

Write-Host "Setup completed."