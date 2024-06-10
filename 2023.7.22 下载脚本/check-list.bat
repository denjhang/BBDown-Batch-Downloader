@echo off
set "txt-name=txt-name"
set "floder-name=floder-name"
echo 当前目录名称：%~nx1
for /f "tokens=1 delims=." %%a in ('dir list\*.txt /b') do (call:Func %%a) 
@REM 批量扫描指定文件夹下的txt播放列表

:Func
echo --------------------------------------
echo 当前目录名称：%~nx1
echo 目前up主名称：%1
echo 该up主播放列表的文件名为 list\%1.txt
set "txt-name=%1"
echo --------------------------------------


For /d %%a in (list\*) Do (
echo 当前扫描到的文件夹名称为：%%~na
REM set "floder-name=%%~na"
echo 当前txt名称为：%txt-name%
REM echo 当前扫描到的文件夹名称为：%floder-name%

if "%txt-name%"=="%%~na" (
echo txt名称与文件夹名称匹配，开始移动
md list\已完成文件夹
move %%a list\已完成文件夹
echo 已完成移动文件夹：move %%a list\已完成文件夹
md list\已完成txt
move list\%txt-name%.txt list\已完成txt
echo 已完成移动txt：move list\%txt-name%.txt list\已完成txt
) else (
 echo txt名称与文件夹名称不匹配
)


echo 扫描文件夹结束
echo --------------------------------------


)
echo 此txt处理结束
goto:eof
