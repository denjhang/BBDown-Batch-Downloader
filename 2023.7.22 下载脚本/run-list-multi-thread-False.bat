@echo off
set "last-video=https://www.bilibili.com/video/av911582789"
set "flag=no"
echo ��ǰĿ¼���ƣ�%~nx1
for /f "tokens=1 delims=." %%a in ('dir list\*.txt /b') do (call:Func %%a) 
@REM ����ɨ��ָ���ļ����µ�txt�����б�

pause

:Func
echo ��ǰĿ¼���ƣ�%~nx1
echo Ŀǰup�����ƣ�%1
echo ��up�������б���ļ���Ϊ list\%1.txt
echo --------------------------------------
echo ���ڿ�ʼɨ�����ص�ַ����־λflag=%flag%
echo Ŀ����Ƶ��ַ��last-video=%last-video%
echo --------------------------------------

For /F %%a in (list\%1.txt) Do (
echo ��ǰɨ�赽����������Ϊ��%%a
echo --------------------------------------
if "%last-video%"=="%%a" (
set "flag=yes"
echo ɨ�赽ָ����Ƶ��ַ�����ñ�־flag="yes"
) else (
 echo ��Ƶ��ַ��ƥ�䣬�������أ�flag=%flag%
)

echo --------------------------------------
if "%flag%"=="yes" (
echo ��ǰĿ¼���ƣ�%~nx1
echo ��ʼ������һ����Ƶ
echo ��ǰ��������Ϊ��%%a
echo ��ִ����䣺BBDown.exe "%%a" --show-all -dd --skip-ai False --multi-thread False --work-dir list\%1\ 

BBDown.exe "%%a" --show-all -dd --skip-ai False --multi-thread False --work-dir list\%1\ 

@REM ���ز����б��ı��ļ����г�����Ƶ�����������ص�Ļ��
echo --------------------------------------
echo ��ǰ��Ƶ��������
echo --------------------------------------
)

)
echo ���ڿ�ʼ������һ���ļ��е�
goto:eof
