

## Progressive Training Guide

### Introduction

Progressive training is a method of training deep learning models that allows for gradual increases in complexity and resolution. This approach can lead to more stable training and better performance.

We start at the lowest resolution that we can distinguish faces, and then progressively increase the resolution as the model learns. This will speed up the training process and allow us to see the swapping results faster so we can adjust the training parameters earlier.

The process and models are designed to be compatible with the DeepFaceLab (DFL) models, so you can use the same parameters and configurations. Models that are at a different growing stage than the base DFL model will need to be merged as DFM models in a new branch of DFL that support DFM merging.

### Usage

To use progressive training you need to set the `growing_stage` parameter in the configuration file. The growing stage can be set to a value between -1 and 1 in public version -2 and 2 in paid version, where -2 is the lowest resolution and 2 is the highest resolution. The default value is 0, which is compatible with DFL models.

Each stage will double the resolution of the model, but will reduce the overall capacity of the model, so you will need to adjust the dimensions accordingly. The growing stage will also append new blocks to the input of the encoder and output of the decoder.

**Config resolution should be resolution as stage 0, this was done to keep the compatibility with DFL models**

### Pretrain

Pretraining models should be put in the `pretrain` folder of the model directory. Trainer will automatically detect the pretrain model and use it for training, it will look for the best pretrain model that matches the growing stage of the current model.

Do not use intermediate models in the pretrain folder, only encoder and decoder.

AMP encoder and decoder are interchangeable with SAEHD -ut or -udt for the encoder and -dt or -udt for the decoder with same dims.

### Merging

Since the models of stages different then 0 are not compatible with the DFL models, you will need to merge them into a new branch of DFL that supports DFM merging.

The merging process is similar to the DFL merging process, but you will need to use the `export_onnx.py` script to export the model to a DFM format or export it in the trainer.

[DeepFaceLab DFM Merge branch](https://github.com/MachineEditor/DeepFaceLab-MVE/tree/onnx-merge)

Guide for updating windows build to support DFM merging [updating-build-to-DFM-merge-fork.md](/dfl-fork/Updating-build-to-DFM-merge-fork.md).