@echo off
call activate.bat
title DFL License
python.exe %TRAINER_DIR%\license_management.py --operation reactivate
pause
