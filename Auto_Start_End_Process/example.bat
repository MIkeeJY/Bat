@echo off

rem 选择选项
echo "1.仅一次打开qq"
echo "2.无限期打开qq(以后程序会在0,6,12,18,24点自启动)"
echo "3.停止无限期打开qq"
rem ps:所谓的无限期打开qq指将程序加入计划任务，使shadowsocks每六小时自动重获密码

CHOICE /C 123 /M ""

if %errorlevel%==1 goto First
if %errorlevel%==2 goto Second
if %errorlevel%==3 goto Third

First:
rem 直接运行程序
C:/Users/Sdite/Desktop/qq.exe
goto Quit

Second:
rem 从0点开始，每六小时打开一次qq这个程序,并直接运行一次计划任务
schtasks /create /sc hourly /mo 6 /tn "Auto" /tr C:/Users/Sdite/Desktop/qq.exe /st 00:00:02 /f
schtasks /run /tn "Auto"
goto Quit

Third:
rem 删除计划任务 "Auto"
schtasks /delete /tn "Auto"
goto Quit


Quit:
