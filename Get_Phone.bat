

REM ��������ʱ�����Ϊ��־�ļ���

SET logfilename=Phone_Info


REM ������������Ŀ¼������APP��־����Ŀ¼

IF NOT EXIST %~dp0   md %~dp0

SET logdir="%~dp0\%appEnName%%appversion%"

IF NOT EXIST %logdir% (

    ECHO.[ Exec ] ����Ŀ¼��%appEnName%%appversion%

    md %logdir%

)

REM ����ֻ���Ϣ����ʾ������

adb shell cat /system/build.prop>phone.info

FOR /F "tokens=1,2 delims==" %%a in (phone.info) do (

    IF %%a == ro.build.version.release SET androidOS=%%b

    IF %%a == ro.product.model SET model=%%b

    IF %%a == ro.product.brand SET brand=%%b

)

del /a/f/q phone.info

ECHO.[ INFO ] ��ȡPhone��Ϣ

ECHO.         �ֻ�Ʒ��: %brand%

ECHO.         �ֻ��ͺ�: %model%

ECHO.         ϵͳ�汾: %androidOS%

ECHO.[Phone]>"%logdir%\%logfilename%.ini"

ECHO.Phone_Brand = %brand%>>"%logdir%\%logfilename%.ini"

ECHO.Phone_Model = %model%>>"%logdir%\%logfilename%.ini"

ECHO.System_Version = %androidOS%>>"%logdir%\%logfilename%.ini"
