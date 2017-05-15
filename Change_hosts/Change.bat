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

@echo off
c:
cd %SystemRoot%\system32\drivers\etc\
echo. >> hosts

echo 0.0.0.0 acm.hdu.edu.cn >> hosts
echo 0.0.0.0 codeforces.com >> hosts
echo 0.0.0.0 poj.org >> hosts
echo 0.0.0.0 cn.bing.com >> hosts
echo 0.0.0.0 www.google.cn >> hosts
echo 0.0.0.0 www.so.com >> hosts
echo 0.0.0.0 www.sogou.com >> hosts
echo 0.0.0.0 www.baidu.com >> hosts
echo 0.0.0.0 baike.baidu.com >> hosts
echo 0.0.0.0 zhidao.baidu.com >> hosts
echo 0.0.0.0 www.hao123.com >> hosts
echo 0.0.0.0 xueshu.baidu.com >> hosts
echo 0.0.0.0 tieba.baidu.com >> hosts
echo 0.0.0.0 blog.csdn.net >> hosts
echo 0.0.0.0 www.zhihu.com >> hosts
echo 0.0.0.0 github.com >> hosts
echo 0.0.0.0 www.acmerblog.com >> hosts
echo 0.0.0.0 www.youdao.com >> hosts
echo 0.0.0.0 fanyi.baidu.com >> hosts
echo 0.0.0.0 translate.google.cn >> hosts
echo 0.0.0.0 fanyi.youdao.com >> hosts
echo 0.0.0.0 www.iciba.com >> hosts
echo 0.0.0.0 www.bing.com/translator >> hosts
echo 0.0.0.0 dict.cn >> hosts
echo 0.0.0.0 fy.iciba.com >> hosts
echo 相关网页已被禁止...
echo 请按回车继续...