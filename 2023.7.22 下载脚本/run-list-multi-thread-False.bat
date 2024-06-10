@echo off
set "last-video=https://www.bilibili.com/video/av911582789"
set "flag=no"
echo 当前目录名称：%~nx1
for /f "tokens=1 delims=." %%a in ('dir list\*.txt /b') do (call:Func %%a) 
@REM 批量扫描指定文件夹下的txt播放列表

pause

:Func
echo 当前目录名称：%~nx1
echo 目前up主名称：%1
echo 该up主播放列表的文件名为 list\%1.txt
echo --------------------------------------
echo 现在开始扫描下载地址，标志位flag=%flag%
echo 目标视频地址：last-video=%last-video%
echo --------------------------------------

For /F %%a in (list\%1.txt) Do (
echo 当前扫描到的下载链接为：%%a
echo --------------------------------------
if "%last-video%"=="%%a" (
set "flag=yes"
echo 扫描到指定视频地址并设置标志flag="yes"
) else (
 echo 视频地址不匹配，跳过下载，flag=%flag%
)

echo --------------------------------------
if "%flag%"=="yes" (
echo 当前目录名称：%~nx1
echo 开始下载下一个视频
echo 当前下载链接为：%%a
echo 现执行语句：BBDown.exe "%%a" --show-all -dd --skip-ai False --multi-thread False --work-dir list\%1\ 

BBDown.exe "%%a" --show-all -dd --skip-ai False --multi-thread False --work-dir list\%1\ 

@REM 下载播放列表文本文件中列出的视频，带参数下载弹幕等
echo --------------------------------------
echo 当前视频下载完了
echo --------------------------------------
)

)
echo 现在开始下载下一个文件夹的
goto:eof
