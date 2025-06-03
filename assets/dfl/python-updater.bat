@echo off
REM Step 1: Download Python
echo Downloading Python...
curl -o python-3.9.13-embed-amd64.zip https://www.python.org/ftp/python/3.9.13/python-3.9.13-embed-amd64.zip

REM Step 2: Extract it to python-3.9.13
echo Extracting Python...
powershell -Command "Expand-Archive -Path 'python-3.9.13-embed-amd64.zip' -DestinationPath 'python-3.9.13'"

REM Step 3: Delete the zip file
echo Deleting the zip file...
del python-3.9.13-embed-amd64.zip

REM Step 4: Inside python folder, delete python39._pth
echo Deleting python39._pth...
del python-3.9.13\python39._pth

REM Step 5: Download get-pip script
echo Downloading get-pip script...
curl -o get-pip.py https://bootstrap.pypa.io/get-pip.py

REM Step 6: Run the get-pip script with no warnings
echo Installing pip...
python-3.9.13\python.exe get-pip.py --no-warn-script-location

REM Step 7: Delete the get-pip script
echo Deleting get-pip script...
del get-pip.py

echo Python 3.9.13 setup is complete with pip installed.
pause
