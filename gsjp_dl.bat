@echo off
chcp 65001 >nul
echo ==========================================
echo GSJPプロファイルダウンロード（非公式）
echo 重要
echo gsjpのファイルで、ご自身で編集されているものはバックアップを取ってください。
echo 熊本のsnjsim、利尻のGate15(v2)用は削除されます。編集する場合は、このファイルを右クリック→編集でコメントアウトの指示に従って編集してください。
echo (熊本のkeisim、利尻のMarin or Gate15(v1)用は削除されません)
echo (gsjp配下でないプロファイルも削除されません)
echo ==========================================
echo.
echo.
echo 実行するには Enter を押してください
echo 中止する場合はウィンドウを閉じてください
pause >nul

mkdir %APPDATA%\Virtuali\GSX\MSFS\.temp
cd %APPDATA%\Virtuali\GSX\MSFS\.temp
git clone https://github.com/GroundServicesJP/GroundServicesJP_GSXProfiles.git
move "%APPDATA%\Virtuali\GSX\MSFS\.temp\GroundServicesJP_GSXProfiles\*" "%APPDATA%\Virtuali\GSX\MSFS\"
rd /s /q %APPDATA%\Virtuali\GSX\MSFS\.temp

cd %APPDATA%\Virtuali\GSX\MSFS\
rem snjsim版お使いの際は、snjsim→keisimに変更してください。
del rjft-snjsim.py
del rjft-snjsim.ini
rem Gate15_v2版お使いの際は、g15v2→g15_marinに変更してください。
del rjer-g15v2.py
del rjer-g15v2.ini