@echo off
set "cmd-name=run-list-multi-thread-False.bat"
set /a a=%Date:~0,4%+1
%cmd-name% | mtee/a/+ %a%-%Date:~5,2%-%Date:~8,2%-%cmd-name%-log.txt