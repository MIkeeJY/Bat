@echo off
rem 开启管理员模式, 如果出现闪退情况
rem 例如在win10中貌似不需要开启管理员模式即可运行下方命令
rem 则将下面:Admin以上到本行的代码注释掉即可
cacls.exe "%SystemDrive%\System Volume Information" >nul 2>nul
if %errorlevel%==0 goto Admin
if exist "%temp%\getadmin.vbs" del /f /q "%temp%\getadmin.vbs"
echo Set RequestUAC = CreateObject^("Shell.Application"^)>"%temp%\getadmin.vbs"
echo RequestUAC.ShellExecute "%~s0","","","runas",1 >>"%temp%\getadmin.vbs"
echo WScript.Quit >>"%temp%\getadmin.vbs"
"%temp%\getadmin.vbs" /f
if exist "%temp%\getadmin.vbs" del /f /q "%temp%\getadmin.vbs"
exit

:Admin

rem 选择选项
CHOICE /C 12 /M "打开wifi请按 1, 关闭请按 2"

if %errorlevel%==1 goto begin
if %errorlevel%==2 goto close

rem 打开wifi
:begin
netsh wlan set hostednetwork mode=allow ssid=Test key=0123456789
netsh wlan start hostednetwork
pause
goto end

rem 关闭wifi
:close
netsh wlan stop hostednetwork
netsh wlan set hostednetwork mode=disallow
pause

:end