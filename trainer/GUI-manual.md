

# This document serves as simple manual about the MVE PyTorch trainer GUI

## 1. Header

![](/assets/images/trainer-header.jpg)

- Save - saves the current model
- Exit - saves the current model and exits the process
- Open Tensorboard - opens tensorboard in a new browser window
- Export DFM - exports the current model into a .dfm file in the model folder listed in console. Models with size larger than 2gb will be exported into multiple files

## 2. Preview

![](/assets/images/trainer-preview-image.jpg)

- Update Preview - update preview or clicking on the preview image will request a new preview. Preview will try to update after upcoming iteration

- Preview Types:
	- Output - Output network image and output data image the network image compares to
	- Masked - Output network image with an output masks and output data image with an image mask
	- Input - Output network image with an input data image into the network, on AMP model it's currently used to display morph factor change preview

## 3. Settings

Settings screen for the trainer, settings field will be the same as in the YAML configuration file. Fields that are grayed out cannot be changed when training process started or their change has not been implemented yet.

![](/assets/images/trainer-settings-page.jpg)

- Update - updates the settings on the trainer

Mode detailed description can be found in [Config parameters](Config-params.md)

### Settings change confirmation

Settings changes will be displayed in the console

![](/assets/images/trainer-console.jpg)


## 4. Sample history

Tracked samples by iteration, tracking sample should be added to model/history/src and /dst folders. Snapshot iterations are saved into model/history/snapshots.
Make sure to have around the same number of src and dst samples, otherwise it might result in an error.

![](/assets/images/trainer-history.jpg)

- Refresh Iterations - refreshes iteration history without refreshing the page
- Reload Data - reloads validation src and dst data loaders, operation is not instant and requires remaking data loader CPU threads
- Preview name dropdown - Preview image name filter
- Previous Snapshot - changes selected iteration to a next lower
- Next Snapshot - changes selected iteration to a next higher

## 5. Model training settings

Model training settings is where we can control the training process of our model. We can freeze or unfreeze layers and reset their weights. Highlighted buttons will update the model training setting on pressing the update button.

![](/assets/images/model-train-control.jpg)

- update - updates the model training settings
- reset - resets the model control to the default values
- refresh data - reloads the model control data from the server

## 6. Tensorboard

External tool to track the loss graphs

![](/assets/images/trainer-tensorboard.jpg)