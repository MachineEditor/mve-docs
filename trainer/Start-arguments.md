version 1.4

### main.py input parameters

Input parameters are appended with --prefix
- src - source face dataset directory
- dst - dst face dataset directory
- model - model output directory
- type - model type SAEHD or AMP
- verbose - detailed weight loading output use for debugging
- config - path to the config YAML file of the model, if not specified trainer will attempt to find a config or data.dat file inside the model directory
- pretrain - path to pretrain model directory
- freeze-old-layers - if set to true, model will freeze all layers that are loaded from the training model, new layers and layers loaded from the pretrain model will be trained
- skip-tensorboard - disable tensorboard
- tensorboard-port - tensorboard port (default: 6006)
- tensorboard-host - tensorboard network address binding (default: 127.0.0.1)
- multi-gpu - models will be allocated to all available GPUs with each GPU having it's own copy of the model (paid version only)
- web-ui-port - custom web GUI port (default: 80)
- webui-address -  webui network address binding (default: 127.0.0.1)
- api-port - custom API port (default: 8000)
- api-address - api network address binding (default: 127.0.0.1)
- loss-port - internal communication port (default: 8001)
- api-auth - enable api auth - generates and post the authentication token on the startup (paid version only)
- api-auth-token - specify an authentication token (paid version only)

### config_exporter.py

Script is used to export DeepFaceLab model parameters to a YAML configuration file

- model - model directory, it will try to find a file of a format "_data.dat"
- type - model type SAEHD or AMP
- output-file - full path to a configuration file that ends with .yaml

### export_onnx.py

Script is used to export DeepFaceLab model to an onnx format .dfm file used for DeepFaceLive. Current limitation is 2gb model size

- model - model directory
- type -  model type SAEHD or AMP
- config - path to the YAML configuration file

### main_merge.py

Simple merge script that produces frames with model output and a second folder with frames with the output face mask

- frames - path to frames directory
- faces - path to faces directory
- model - path to model directory
- type - model type SAEHD or AMP
- config - path to the YAML configuration file
- output - path to the output frame directory, masks will be saved into output_mask directory
- format - force output format type to jpg or png, if not specified the output format will be the same as input frames
- verbose - detailed weight loading output use for debugging

### license_management.py (only used in premium version)

Script used to managed license activation and deactivation. When switching devices the license needs to be deactivated first before being activated on another device

- activate - prompts for a license key or tries to load a saved key and then activates the key
- deactivate - deactivates the key
- reactivate - deactivates the current activation and tries to reactivate it



