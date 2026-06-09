#!/bin/bash
#
#
#
# LTX 2.3 RunPod Setup Script
#
# Downloads:
# - LTX 2.3 FP8 Distilled
# - Gemma 3 12B
# - VAEs
# - Text Projection
# - Required Custom Nodes
# - Quality enhancement LoRA's
#
# Intended for:
# RunPod CUDA Template with pre-installed ComfyUI
#
#
# 
set -e
echo 
echo 
echo "#####################"
echo "### INSTALL ARIA2 ###"
echo "#####################"
echo 
echo 

apt update && apt install aria2 -y

echo 
echo "### SUCCESSFUL ###"
echo 
echo 
echo "####################################"
echo "### SETTING COMFYUI STARTUP ARGS ###"
echo "####################################"
echo 
echo

cat <<EOL > "/workspace/runpod-slim/comfyui_args.txt"
--highvram
--disable-smart-memory
--dont-upcast-attention
EOL

echo 
echo 
echo "### SUCCESSFUL ###"
echo 
echo 
echo 
echo "##############################"
echo "### DOWNLOADING ESSENTIALS ###"
echo "##############################"

# LTX-2.3 distilled fp8
aria2c -x 16 -s 16 -k 1M --dir="/workspace/runpod-slim/ComfyUI/models/diffusion_models" --out="ltx-2.3-22b-distilled-fp8.safetensors" "https://huggingface.co/Lightricks/LTX-2.3-fp8/resolve/main/ltx-2.3-22b-distilled-fp8.safetensors?download=true"

# tael
aria2c -x 16 -s 16 -k 1M --dir="/workspace/runpod-slim/ComfyUI/models/vae" --out="taeltx2_3.safetensors" "https://huggingface.co/Kijai/LTX2.3_comfy/resolve/main/vae/taeltx2_3.safetensors?download=true"

# spatial upscaler 1.1
aria2c -x 16 -s 16 -k 1M --dir="/workspace/runpod-slim/ComfyUI/models/latent_upscale_models" --out="ltx-2.3-spatial-upscaler-x2-1.1.safetensors" "https://huggingface.co/Lightricks/LTX-2.3/resolve/main/ltx-2.3-spatial-upscaler-x2-1.1.safetensors?download=true"

# gemma 3 12b fp8
aria2c -x 16 -s 16 -k 1M --dir="/workspace/runpod-slim/ComfyUI/models/text_encoders" --out="gemma-3-12b-it-heretic-v2_fp8_e4m3fn.safetensors" "https://huggingface.co/lynaNSFW/gemma-3-12b-it-heretic-v2_fp8_e4m3fn/resolve/main/gemma-3-12b-it-heretic-v2_fp8_e4m3fn.safetensors?download=true"

# text projection bf16
aria2c -x 16 -s 16 -k 1M --dir="/workspace/runpod-slim/ComfyUI/models/text_encoders" --out="ltx-2.3_text_projection_bf16.safetensors" "https://huggingface.co/Kijai/LTX2.3_comfy/resolve/main/text_encoders/ltx-2.3_text_projection_bf16.safetensors?download=true"

# audio + video vae
aria2c -x 16 -s 16 -k 1M --dir="/workspace/runpod-slim/ComfyUI/models/vae" --out="LTX23_audio_vae_bf16.safetensors" "https://huggingface.co/Kijai/LTX2.3_comfy/resolve/main/vae/LTX23_audio_vae_bf16.safetensors?download=true"
aria2c -x 16 -s 16 -k 1M --dir="/workspace/runpod-slim/ComfyUI/models/vae" --out="LTX23_video_vae_bf16.safetensors" "https://huggingface.co/Kijai/LTX2.3_comfy/resolve/main/vae/LTX23_video_vae_bf16.safetensors?download=true"

# distilled lora
aria2c -x 16 -s 16 -k 1M --dir="/workspace/runpod-slim/ComfyUI/models/loras" --out="ltx-2.3-22b-distilled-lora-fro90_ceil72.safetensors" "https://huggingface.co/TenStrip/LTX2.3_Distilled_Lora_1.1_Experiments/resolve/main/ltx-2.3-22b-distilled-lora-fro90_ceil72.safetensors?download=true"

# detailer lora
aria2c -x 16 -s 16 -k 1M --dir="/workspace/runpod-slim/ComfyUI/models/loras" --out="ltx-2-19b-ic-lora-detailer.safetensors" "https://huggingface.co/Lightricks/LTX-2-19b-IC-LoRA-Detailer/resolve/main/ltx-2-19b-ic-lora-detailer.safetensors?download=true"

echo 
echo 
echo "SUCCESSFUL"
echo 
echo 
echo "############################"
echo "### CLONING CUSTOM NODES ###"
echo "############################"
echo 
echo 

cd /workspace/runpod-slim/ComfyUI/custom_nodes

if [ ! -d "WhatDreamsCost-ComfyUI" ]; then
    git clone https://github.com/WhatDreamsCost/WhatDreamsCost-ComfyUI
fi

echo 
echo 

echo "ALL TASKS WERE SUCCESSFULLY COMPLETED!"
