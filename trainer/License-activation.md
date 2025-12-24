

## License Activation (paid version only)

License information should be available in the e-mail you used to purchase the license.

General MVE trainer license is one license per active training process.

After license key has been activated it will be saved in the .settings folder for future activations.

### Script license_management.py

To activate or deactivate your license using the script, open a terminal or command prompt, navigate to the trainer directory, and run the following commands:

- To activate your license:
    ```bash
    python license_management.py --operation reactivate
    ```

This will unregister the license on the current device (if previously activated) and prompt you to enter your license key for activation.

Other options are `--operation activate` to activate the license and `--operation deactivate` to deactivate the license on the current device.

 ### Windows workspace bat

If you are using the Windows workspace batch files, you can download the license activation batch file from the link

- [license.bat](/assets/dfl/license.bat).

Place the batch file in the DeepFaceLab workspace directory and run it. Follow the prompts to enter your license key and activate your license.


If you encounter any issues during activation, please contact our support team for assistance.