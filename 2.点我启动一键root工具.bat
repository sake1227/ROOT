@echo off
color 9f

title һ��root���� ���ߣ�����

set name=���� GT5 Pro
set lujing=init_boot
set wenjian=init_boot

:main
cls
echo. 
echo. 
echo.    %name% һ��root������ ���ߣ�����
echo. --------------------------------------------
echo. 
echo. ��׿�������Ⱥ��764705161    ����΢�ţ�QY50006
echo. 
echo.    ��������Ҫ�ֻ������ӵ��Բ���ȨUSB����
echo. 
echo. --------------------------------------------
echo. 
echo. �������ѡ����Ҫ�õĹ��ܣ�
echo.
echo. 1.����BL
echo. 2.����BL������������
echo. 3.��װ��Ȳ���
echo. 4.ˢ��ROOT
echo. 5.�ָ�ROOT
echo. 6.��װ���
echo. 7.������ݣ���ʽ��data������
echo. 
set a=
set /p a=���������ѡ�
if not "%a%"=="" set a=%a:~0,1%
if "%a%" == "1" goto jiesuo
if "%a%" == "2" goto huisuo
if "%a%" == "3" goto shendu
if "%a%" == "4" goto xuanze
if "%a%" == "5" goto huifu
if "%a%" == "6" goto anzhuang
if "%a%" == "7" goto qingchu
echo. ������Ч���������������ҳ
pause>nul 

goto main

:xuanze
cls
echo. 
echo. 
echo.    %name% һ��root������ ���ߣ�����
echo. --------------------------------------------
echo. 
echo. ��׿�������Ⱥ��764705161    ����΢�ţ�QY50006
echo. 
echo.        ���Ƚ��ֻ����ӵ��Բ���ȨUSB����
echo. 
echo. --------------------------------------------
echo. 
echo. ��ѡ���ֻ���ǰ״̬���������֣���
echo.
echo. 1.����״̬
echo. 2.FASTBOOTģʽ
echo. b.������ҳ
echo.
set a=
set /p a=���������ѡ�
if not "%a%"=="" set a=%a:~0,1%
if "%a%" == "1" goto bootloader
if "%a%" == "2" goto root
if "%a%" == "b" goto main
echo. 
echo.������Ч�����������������
echo.
pause>nul 

goto main

:bootloader
echo.
echo. ���ڼ���ֻ��Ƿ�����
echo.
echo.����ʱ��ͣ���������������USB���Ե����� �������ù���
adb wait-for-device
echo.

adb reboot-bootloader
echo. ���ڽ���FASTBOOTģʽ
goto root

:root
echo.
echo. ���ڼ���ֻ��Ƿ�����
echo.
echo.����ʱ��ͣ����������������Ƿ�ԭװ�����ߵ����� �������ù���
fastboot wait-for-device
echo.

echo. ����ˢ��root�ļ�
fastboot flash %lujing% IMG\root.img
fastboot --disable-verity --disable-verification flash vbmeta IMG\vbmeta.img
fastboot reboot
echo.
echo.��ʾ�ĸ�OKEY����ʾˢ��ɹ����ֻ�����������
echo.����������ϣ���������˳�
echo.
pause>nul 

goto exit

:huifu
cls
echo. 
echo. 
echo.    %name% һ��root������ ���ߣ�����
echo. --------------------------------------------
echo. 
echo. ��׿�������Ⱥ��764705161    ����΢�ţ�QY50006
echo. 
echo.           �����ֶ�����FASTBOOTģʽ
echo.
echo. --------------------------------------------

echo. ���롰b��������ҳ���������������������
set a=
set /p a=���������ѡ��
if "%a%" == "b" goto main
pause>nul
echo.
echo. ���ڼ���ֻ��Ƿ�����
echo.
echo.����ʱ��ͣ����������������Ƿ�ԭװ�����ߵ����� �������ù���
fastboot wait-for-device
echo.
fastboot flash %lujing% %wenjian%.img

echo.
echo.��ʾ����OKEY����ʾˢ��ɹ�
echo.�ֻ��������������������������ҳ
echo.
pause>nul 

goto main

:qingchu
cls
echo. 
echo. 
echo.    %name% һ��root������ ���ߣ�����
echo. --------------------------------------------
echo. 
echo. ��׿�������Ⱥ��764705161    ����΢�ţ�QY50006
echo. 
echo.          �����ֶ�����FASTBOOTģʽ
echo.
echo. --------------------------------------------
echo. �������������ҳ������ ��1�� �����������
set a=
set /p a=���������ѡ��
if "%a%" == "1" goto jixu
pause>nul 
goto main

:jixu
echo.
echo. ���ڼ���ֻ��Ƿ�����
echo.
echo.����ʱ��ͣ����������������Ƿ�ԭװ�����ߵ����� �������ù���
fastboot wait-for-device
echo.
fastboot erase userdata
echo.
echo. ����ݷ���ȷ���Ƿ�����ɹ�,�������������ҳ
echo. 
pause>nul 

goto main

:anzhuang
cls
echo. 
echo. 
echo.    %name% һ��root������ ���ߣ�����
echo. --------------------------------------------
echo. 
echo. ��׿�������Ⱥ��764705161    ����΢�ţ�QY50006
echo. 
echo.          �ֻ����ӵ��Բ���ȨUSB����
echo.
echo. --------------------------------------------
echo.
echo. �뿴�ֻ��Ƿ���ת��װҳ�棬��û�з�Ӧ��ѹ�����APKĿ¼�������������ֻ��ֶ���װ
adb install APK\magisk.apk
echo.
echo. �������������ҳ
pause>nul 

goto main

:jiesuo
cls
echo. 
echo. 
echo.    %name% һ��root������ ���ߣ�����
echo. --------------------------------------------
echo. 
echo. ��׿�������Ⱥ��764705161    ����΢�ţ�QY50006
echo. 
echo.        ���Ƚ��ֻ�����FASTBOOTģʽ
echo. 
echo.       (Y��ִ�н������N��������ҳ)
echo. --------------------------------------------
set a=
set /p a=�Ƿ������[Y/N]��
if not "%a%"=="" set a=%a:~0,1%
if "%a%" == "Y" goto jiiesuo2
if "%a%" == "y" goto jiesuo2
if "%a%" == "N" goto main
if "%a%" == "n" goto main
echo.
echo. ������Ч�����������������
pause>nul

goto jiesuo

:jiesuo2
echo.
echo. ���ڼ���ֻ��Ƿ�����
echo.
echo.����ʱ��ͣ����������������Ƿ�ԭװ�����ߵ����� �������ù���
fastboot wait-for-device
echo.
fastboot flashing unlock
echo. ����ִ�гɹ��������ֻ���ȷ�Ͻ�����������ѡ��ڶ���ѡ���Դ��ȷ�ϼ��ɣ����������������ҳ
pause>nul

goto main

:huisuo
cls
echo. 
echo. 
echo.    %name% һ��root������ ���ߣ�����
echo. --------------------------------------------
echo. 
echo. ��׿�������Ⱥ��764705161    ����΢�ţ�QY50006
echo. 
echo.        ���Ƚ��ֻ�����FASTBOOTģʽ
echo. 
echo.       (Y������ִ�����N��������ҳ)
echo. --------------------------------------------
echo.
echo. ����:��Σ�ղ�����
echo. 
echo. �����˲���ǰ����ȷ���ֻ�ȫ�������Ѿ��ָ����ٷ�δ�޸İ汾
echo.
echo.   (�Է���ש�����ڻ���ǰ����һ��ϵͳ��������ˢ����ϵͳ)
echo.
set a=
set /p a=�˲�����������ݣ��Ƿ������[Y/N]��
if not "%a%"=="" set a=%a:~0,1%
if "%a%" == "Y" goto huisuo2
if "%a%" == "y" goto huisuo2
if "%a%" == "N" goto main
if "%a%" == "n" goto main
echo.
echo. ������Ч�����������������
pause>nul

goto huisuo

:huisuo2
echo.
echo. ���ڼ���ֻ��Ƿ�����
echo.
echo.����ʱ��ͣ����������������Ƿ�ԭװ�����ߵ����� �������ù���
fastboot wait-for-device
echo.
fastboot erase userdata
fastboot flashing lock
echo. ����ִ�гɹ��������ֻ���ȷ�Ͻ�����������ѡ��ڶ���ѡ���Դ��ȷ�ϼ��ɣ����������������ҳ
pause>nul

goto main

:shendu
cls
echo. 
echo. 
echo.    %name% һ��root������ ���ߣ�����
echo. --------------------------------------------
echo. 
echo. ��׿�������Ⱥ��764705161    ����΢�ţ�QY50006
echo. 
echo. --------------------------------------------
echo. 
echo. ������Ȳ���APK:https://www.123pan.com/s/8X3lVv-xzU8H.html  (��������Զ���ת)
pause>nul
explorer https://www.123pan.com/s/8X3lVv-xzU8H.html
echo.
echo. ��ת��ɣ��������������ҳ
pause>nul
goto main

:exit
exit