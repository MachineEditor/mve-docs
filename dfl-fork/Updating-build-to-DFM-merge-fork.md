## How to update DeepFaceLab NVIDIA RTX 3000 series build to DFM merge fork


1. Download and overwrite DeepFaceLab code found inside `_internal` directory https://github.com/MachineEditor/DeepFaceLab-MVE/tree/onnx-merge

2. Download the bat file to `_internal` and run it, it will download and setup python 3.9
   - [python-updater.bat](/assets/dfl/python-updater.bat)

3. Edit the setenv.bat and python_console.bat to point to the new python folder /python-3.9.13

4. Install the new dependencies, open python_console it should use the new python, go to DeepFaceLab folder and run
    ```bash
    pip install -r requirements-cuda-py39.txt --use-deprecated=legacy-resolver
    ```

5. Download Merge DFM bat file and put it in the directory with other bat files
    - [merge-dfm.bat](/assets/dfl/merge-dfm.bat)