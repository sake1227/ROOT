@echo off
color 9f

title 一键root工具 作者：北简

set name=真我 GT5 Pro
set lujing=init_boot
set wenjian=init_boot

:main
cls
echo. 
echo. 
echo.    %name% 一键root工具箱 作者：北简
echo. --------------------------------------------
echo. 
echo. 安卓玩机交流群：764705161    作者微信：QY50006
echo. 
echo.    本工具需要手机先连接电脑并授权USB调试
echo. 
echo. --------------------------------------------
echo. 
echo. 输入序号选择你要用的功能：
echo.
echo. 1.解锁BL
echo. 2.回锁BL（谨慎操作）
echo. 3.安装深度测试
echo. 4.刷入ROOT
echo. 5.恢复ROOT
echo. 6.安装面具
echo. 7.清除数据（格式化data分区）
echo. 
set a=
set /p a=请输入你的选项：
if not "%a%"=="" set a=%a:~0,1%
if "%a%" == "1" goto jiesuo
if "%a%" == "2" goto huisuo
if "%a%" == "3" goto shendu
if "%a%" == "4" goto xuanze
if "%a%" == "5" goto huifu
if "%a%" == "6" goto anzhuang
if "%a%" == "7" goto qingchu
echo. 输入无效，按任意键返回主页
pause>nul 

goto main

:xuanze
cls
echo. 
echo. 
echo.    %name% 一键root工具箱 作者：北简
echo. --------------------------------------------
echo. 
echo. 安卓玩机交流群：764705161    作者微信：QY50006
echo. 
echo.        请先将手机连接电脑并授权USB调试
echo. 
echo. --------------------------------------------
echo. 
echo. 请选择手机当前状态（输入数字）：
echo.
echo. 1.开机状态
echo. 2.FASTBOOT模式
echo. b.返回主页
echo.
set a=
set /p a=请输入你的选项：
if not "%a%"=="" set a=%a:~0,1%
if "%a%" == "1" goto bootloader
if "%a%" == "2" goto root
if "%a%" == "b" goto main
echo. 
echo.输入无效，按任意键重新输入
echo.
pause>nul 

goto main

:bootloader
echo.
echo. 正在检查手机是否连接
echo.
echo.若长时间停留请检查电脑驱动，USB调试等问题 并重启该工具
adb wait-for-device
echo.

adb reboot-bootloader
echo. 正在进入FASTBOOT模式
goto root

:root
echo.
echo. 正在检查手机是否连接
echo.
echo.若长时间停留请检查电脑驱动，是否原装数据线等问题 并重启该工具
fastboot wait-for-device
echo.

echo. 正在刷入root文件
fastboot flash %lujing% IMG\root.img
fastboot --disable-verity --disable-verification flash vbmeta IMG\vbmeta.img
fastboot reboot
echo.
echo.显示四个OKEY即表示刷入成功，手机将重新启动
echo.程序运行完毕，按任意键退出
echo.
pause>nul 

goto exit

:huifu
cls
echo. 
echo. 
echo.    %name% 一键root工具箱 作者：北简
echo. --------------------------------------------
echo. 
echo. 安卓玩机交流群：764705161    作者微信：QY50006
echo. 
echo.           请先手动进入FASTBOOT模式
echo.
echo. --------------------------------------------

echo. 输入“b”返回主页，按其他任意键继续操作
set a=
set /p a=请输入你的选择：
if "%a%" == "b" goto main
pause>nul
echo.
echo. 正在检查手机是否连接
echo.
echo.若长时间停留请检查电脑驱动，是否原装数据线等问题 并重启该工具
fastboot wait-for-device
echo.
fastboot flash %lujing% %wenjian%.img

echo.
echo.显示两个OKEY即表示刷入成功
echo.手机请自行重启，按任意键返回主页
echo.
pause>nul 

goto main

:qingchu
cls
echo. 
echo. 
echo.    %name% 一键root工具箱 作者：北简
echo. --------------------------------------------
echo. 
echo. 安卓玩机交流群：764705161    作者微信：QY50006
echo. 
echo.          请先手动进入FASTBOOT模式
echo.
echo. --------------------------------------------
echo. 按任意键返回主页，输入 “1” 继续清除数据
set a=
set /p a=请输入你的选择：
if "%a%" == "1" goto jixu
pause>nul 
goto main

:jixu
echo.
echo. 正在检查手机是否连接
echo.
echo.若长时间停留请检查电脑驱动，是否原装数据线等问题 并重启该工具
fastboot wait-for-device
echo.
fastboot erase userdata
echo.
echo. 请根据返回确定是否清楚成功,按任意键返回主页
echo. 
pause>nul 

goto main

:anzhuang
cls
echo. 
echo. 
echo.    %name% 一键root工具箱 作者：北简
echo. --------------------------------------------
echo. 
echo. 安卓玩机交流群：764705161    作者微信：QY50006
echo. 
echo.          手机连接电脑并授权USB调试
echo.
echo. --------------------------------------------
echo.
echo. 请看手机是否跳转安装页面，若没有反应请把工具箱APK目录里面的软件传到手机手动安装
adb install APK\magisk.apk
echo.
echo. 按任意键返回主页
pause>nul 

goto main

:jiesuo
cls
echo. 
echo. 
echo.    %name% 一键root工具箱 作者：北简
echo. --------------------------------------------
echo. 
echo. 安卓玩机交流群：764705161    作者微信：QY50006
echo. 
echo.        请先将手机进入FASTBOOT模式
echo. 
echo.       (Y：执行解锁命令，N：返回主页)
echo. --------------------------------------------
set a=
set /p a=是否继续？[Y/N]：
if not "%a%"=="" set a=%a:~0,1%
if "%a%" == "Y" goto jiiesuo2
if "%a%" == "y" goto jiesuo2
if "%a%" == "N" goto main
if "%a%" == "n" goto main
echo.
echo. 输入无效，按任意键重新输入
pause>nul

goto jiesuo

:jiesuo2
echo.
echo. 正在检查手机是否连接
echo.
echo.若长时间停留请检查电脑驱动，是否原装数据线等问题 并重启该工具
fastboot wait-for-device
echo.
fastboot flashing unlock
echo. 命令执行成功，请在手机端确认解锁（音量键选择第二个选项，电源键确认即可），按任意键返回主页
pause>nul

goto main

:huisuo
cls
echo. 
echo. 
echo.    %name% 一键root工具箱 作者：北简
echo. --------------------------------------------
echo. 
echo. 安卓玩机交流群：764705161    作者微信：QY50006
echo. 
echo.        请先将手机进入FASTBOOT模式
echo. 
echo.       (Y：继续执行命令，N：返回主页)
echo. --------------------------------------------
echo.
echo. 警告:【危险操作】
echo. 
echo. 继续此操作前请先确保手机全部分区已经恢复到官方未修改版本
echo.
echo.   (以防变砖请先在回锁前升级一次系统，或者重刷整个系统)
echo.
set a=
set /p a=此操作会清空数据，是否继续？[Y/N]：
if not "%a%"=="" set a=%a:~0,1%
if "%a%" == "Y" goto huisuo2
if "%a%" == "y" goto huisuo2
if "%a%" == "N" goto main
if "%a%" == "n" goto main
echo.
echo. 输入无效，按任意键重新输入
pause>nul

goto huisuo

:huisuo2
echo.
echo. 正在检查手机是否连接
echo.
echo.若长时间停留请检查电脑驱动，是否原装数据线等问题 并重启该工具
fastboot wait-for-device
echo.
fastboot erase userdata
fastboot flashing lock
echo. 命令执行成功，请在手机端确认解锁（音量键选择第二个选项，电源键确认即可），按任意键返回主页
pause>nul

goto main

:shendu
cls
echo. 
echo. 
echo.    %name% 一键root工具箱 作者：北简
echo. --------------------------------------------
echo. 
echo. 安卓玩机交流群：764705161    作者微信：QY50006
echo. 
echo. --------------------------------------------
echo. 
echo. 真我深度测试APK:https://www.123pan.com/s/8X3lVv-xzU8H.html  (按任意键自动跳转)
pause>nul
explorer https://www.123pan.com/s/8X3lVv-xzU8H.html
echo.
echo. 跳转完成，按任意键返回主页
pause>nul
goto main

:exit
exit