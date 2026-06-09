# ComfyUI RunPod LTX 2.3 Quickstart

## Overview

This repository contains a practical setup for running LTX 2.3 video generation workflows with ComfyUI on RunPod.

The project was created to simplify the deployment process and reduce the amount of manual setup required before generating videos.

Included are:

* RunPod deployment workflow
* model download automation script
* ComfyUI workflow configuration
* supporting documentation and tutorials

---

## 🎥 Video Tutorial

[![LTX Video 2.3 Tutorial](https://img.youtube.com/vi/ZtwGFtTY37U/hqdefault.jpg)](https://youtu.be/ZtwGFtTY37U)
## Purpose

The goal of this project is to provide a straightforward way to:

1. Deploy a RunPod instance
2. Download required LTX 2.3 models
3. Load a working ComfyUI workflow
4. Generate a first video with minimal setup effort

This repository focuses on practical usage and onboarding rather than the internal implementation details of ComfyUI or LTX.

---

## Target Audience

This project is intended for:

* ComfyUI beginners
* AI hobbyists
* content creators
* users new to RunPod
* anyone looking for a quick LTX 2.3 setup

---

## Repository Structure

```text
.
├── workflow/
├── scripts/
├── docs/
└── README.md
```

### scripts

Contains automation scripts used to download required models and dependencies.

### workflows

Contains the ComfyUI workflow files used throughout the tutorials.

### docs

Additional documentation, setup notes, troubleshooting information and tutorial material.

---

## Requirements

Before starting, you should have:

* a RunPod account
* basic familiarity with file management and web browsers

No prior ComfyUI experience is required.

---

## Quick Start

### 1. Download the workflow 

### 2. Set up a RunPod instance

Deploy a compatible RunPod template with ComfyUI installed.

### 3. Run the download script

Use the inbuilt Webterminal to clone the github repository to the running pod.
Execute the provided script to download all required models.

---Single Command to copy and paste---
(CTRL+SHIFT+V to paste into Webterminal)

git clone https://github.com/yagami-leito/comfyui-rundpod-ltx2.3 && cd comfyui-runpod-ltx2.3/scripts && chmod +x download_models.sh && bash download_models.sh


### 4. Load the workflow

Open ComfyUI and import the provided workflow, which you downloaded in the first Step of this tutorial. (You can drag and drop the .json file into the ComfyUI-Tab of your browser to import the workflow.)

### 5. Set up the workflow

Install Missing Nodes via ComfyUI-Manager and select the models and files that were downloaded by the script.

### 6. Run Image-to-Video Generation

Create a short videoclip from an image you provide, that then acts as the starting frame for the generated video. 

   ### 6a. Run Text-to-Video Generation

   You describe the desired content of the        generated video in the prompt.
   
---

## Troubleshooting

Common issues:

* Missing custom nodes
* Missing models
* Incorrect file locations
* Insufficient VRAM

Refer to the documentation folder for additional guidance.

---

## Learning Objectives

After following this guide, users should be able to:

* deploy a RunPod environment
* use a ComfyUI workflow
* download and organize required models
* generate videos using LTX 2.3

---

## Disclaimer

This repository is intended for educational and demonstration purposes.

The workflows and scripts included here are designed to simplify setup and help users understand the deployment process.
