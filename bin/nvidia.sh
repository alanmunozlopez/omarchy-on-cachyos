#!/bin/bash
set -e

# CUSTOMIZED: skip driver changes, keep CachyOS nvidia-open stack
# Only apply the parts we want: VA-API utils + Hyprland env vars

echo "[*] Skipping driver replacement (keeping current nvidia-open stack)"

# Install VA-API utils (useful regardless of driver)
sudo pacman -S --needed --noconfirm libva-utils

# Add NVIDIA environment variables for UWSM (needed for Hyprland)
mkdir -p $HOME/.config/uwsm
cat >>$HOME/.config/uwsm/env <<'EOF'
# NVIDIA
export LIBVA_DRIVER_NAME=nvidia
export GBM_BACKEND=nvidia-drm
export __GLX_VENDOR_LIBRARY_NAME=nvidia
export NVD_BACKEND=direct
export MOZ_DISABLE_RDD_SANDBOX=1
export CUDA_DISABLE_PERF_BOOST=1
EOF

echo "[*] Done. Kept existing nvidia-open drivers."