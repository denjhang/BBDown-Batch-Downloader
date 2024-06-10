@echo Off
For /F %%a in (list.txt) Do (start /b BBDown.exe "%%a" --work-dir list\)
pause