@echo off
set "txt-name=txt-name"
set "floder-name=floder-name"
echo ��ǰĿ¼���ƣ�%~nx1
for /f "tokens=1 delims=." %%a in ('dir list\*.txt /b') do (call:Func %%a) 
@REM ����ɨ��ָ���ļ����µ�txt�����б�

:Func
echo --------------------------------------
echo ��ǰĿ¼���ƣ�%~nx1
echo Ŀǰup�����ƣ�%1
echo ��up�������б���ļ���Ϊ list\%1.txt
set "txt-name=%1"
echo --------------------------------------


For /d %%a in (list\*) Do (
echo ��ǰɨ�赽���ļ�������Ϊ��%%~na
REM set "floder-name=%%~na"
echo ��ǰtxt����Ϊ��%txt-name%
REM echo ��ǰɨ�赽���ļ�������Ϊ��%floder-name%

if "%txt-name%"=="%%~na" (
echo txt�������ļ�������ƥ�䣬��ʼ�ƶ�
md list\������ļ���
move %%a list\������ļ���
echo ������ƶ��ļ��У�move %%a list\������ļ���
md list\�����txt
move list\%txt-name%.txt list\�����txt
echo ������ƶ�txt��move list\%txt-name%.txt list\�����txt
) else (
 echo txt�������ļ������Ʋ�ƥ��
)


echo ɨ���ļ��н���
echo --------------------------------------


)
echo ��txt�������
goto:eof
