
## MVE PyTorch trainer configuration parameters

This document describes the configuration parameters for the MVE PyTorch trainer. The parameters are divided into several sections, each with its own purpose. The parameters are similar to those used in DeepFaceLab (DFL) but have some differences and additional options.


### Sections:
- [General Parameters](#general-parameters)
- [Model Parameters](#model-parameters)
- [Training Parameters](#training-parameters)
- [Data Loading (Image and mask caching)](#data-loading-image-and-mask-caching)
- [Data Augmentation](#data-augmentation)
- [GAN options](#gan-options)

### General Parameters

- name - Prefix for the model files

### Model Parameters

Model parameters are the same as DeepFaceLab parameters

Model growing is a process of training the model with a low resolution and then increasing the resolution and training it further. Each stage appends new block to the input of the encoder and output of the decoder and each stage double the resolution of the model but reduces the overall capacity so the dimensions need to be adjusted accordingly. Growing can increase the training speed and add stability to the training process, but it is not required for training.

- archi - saehd model architecture (only SAEHD - valid values are -u, -t, -d)
- resolution - model resolution, should be dividable by 32 (448 is max for free version)
- ae_dim - autoencoder dimensions
- e_dims - encoder dimensions
- d_dims - decoder dimensions
- d_mask_dims - mask decoder dimensions
- face_type - training face crop
- growing_stage - model growing, default is 0, which means DFL compatible model (free version supports from -1 to 1, paid version -2 to 2)

### Training Parameters

Training parameters are used to control the training process, they are similar to DFL parameters, but with some differences.

- mp_mode:
	- full - full precision operations
	- full_t - full precision mode with the use of Tensor cores, reduction in precision with an increase of speed
	- float16 - same precision as full_t with smaller min and max values,  memory and speed benefits, not compatible with if the model values are less then minimum value of float16 (needs clipgrad it can randomly collapse on a high loss)
	- bfloat - precision loss memory and speed benefits, has the same min and max values a float but has a lot lesser value density (compatible with full precision)
 ![Number types for training](/assets/images/trainer-taining-number-type.jpg)

- pin samples - data loader will load samples into GPU shared memory to reduce the transfer time to the GPU (uses shared GPU memory)
- morph_factor - morph factor between src and dst face (AMP model only)
- autobackup_hour - after how many hours the model is automatically backed up
- maximum_n_backups - maximum number of backups to keep
- batch_size - training batch size
- batch_dst_mixing - adds src samples to a dst batch, should be used only LIAE  (value is 0 to 1 where 1 is dst is full src - 1)
- masked_training - enable or disable training inside a mask
- eye_mouth_priority - enable or disable eye/mouth mask priority
- blur_out_mask - blurs the background outside of the face mask of target (images used to calculate loss) images
- uniform_yaw - load samples from a yaw face angle distributions, every yaw angle would get trained equally
- lr - model learning rate
- lr_dropout - will randomly drop 70% of the weight updates
- keep_graph - keeps both src and dst graph in memory, increased the VRAM memory but decreases iteration speed, to match DFL behavior set it to false
- cpu_cap - number of cpu cores used for data loading per dataset so src data loader and dst data loader would use cpu_cap thread number each
- clipgrad - thresholds the model update values, uses clip by history by tracking last 1000 iterations to determine the threshold, adds 20+ ms to each iterations
- loss - loss type ssim (default from DFL), m_ssim multiscale ssim (experimental)
- weight_decay -  modifier to reduce large internal weight updates
- snapshot_interval - if history samples set, it will generate a preview depending on the interval

### Data Loading (Image and mask caching)

Image caching is used reduce some of the CPU load while data loading. It's not necessary to use it, but it's recommended.

Data cache folder is located in in the model folder named `.face_cache_` suffix. Within that folder there are subfolders based on resolution, inside those folder you can find image and mask data.

Cached images and masks are generated from original face images. Caching masks could take a lof of time on higher resolutions since we're doing resizing and blurring, be ready to wait a bit.

- use_cache - enable or disable cache usage
- folder_suffix - suffix for the cache folder inside the model folder
- image_type - image type used for caching, using jpg can reduce disk reading and usage
- image_quality - image quality used when image type is set to jpg
- force_recache - recaches all faces


### Data Augmentation

Options are used to modify data loading process, advanced settings are not recommended to change unless you know what you're doing, not required options are not required for training, but can be used to augment the dataset. For example src flip would be used in pretraining with dst flip.
Other options are used at the start of the training and turned off as the training progresses.

- random_warp - randomly wraps the input samples
- random_noise - randomly adds noise to the input samples (not required for training)
- random_src_flip - randomly flips src samples (not required for training)
- random_dst_flip - randomly flips dst samples
- color_augmentation - randomly augments image color based on cc-aug from DFL-mve

Usually we don't change those values
- scale_range - randomly scales samples (advanced)
- rotation_range - randomly rotates samples (advanced)
- tx_range - randomly translates samples in x direction (advanced)
- ty_range - randomly translates samples in y direction (advanced)

### GAN options

Options related to GAN training mode

- gan_training - enables or disables the discriminator model used in GAN training
- gan_power - multiplier for GAN loss to the src model loss, GAN generator loss values can be monitored in tesnorboard
- gan_dims - the dimensions of the GAN network. The higher dimensions, the more VRAM is required. You can get sharper edges even at the lowest setting. Typical fine value is 16.
- gan_patch_size - The dimensions of the GAN network. The higher dimensions, the more VRAM is required. You can get sharper edges even at the lowest setting. Typical fine value is 16.
- gan_weight_decay - modifier to reduce large internal weight updates
- gan_smoothing - uses soft labels with values slightly off from 0/1 for GAN, has a regularizing effect
- gan_noise - marks some images with the wrong label, helps prevent collapse
