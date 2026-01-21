@echo off
setlocal

set BASE=%APPDATA%\Virtuali\GSX\MSFS
set TEMP=%BASE%\.temp

echo ==========================================
echo GSJPプロファイルダウンロード（非公式）
echo.
echo ★★重要★★
echo gsjpのファイルで、ご自身で編集されているものはバックアップしてください
echo 熊本 snjsim、利尻 Gate15(v2) 用は削除されます
echo 編集する場合は、このbatを右クリック→編集して
echo rem 行（コメントアウト）の指示に従ってください
echo.
echo （備考）
echo 熊本 keisim、利尻 Marin / Gate15(v1) 用は削除されません
echo gsjp配下でないプロファイルも削除されません
echo ==========================================
echo.
echo 実行するには Enter を押してください
echo 中止する場合はウィンドウを閉じてください
pause >nul

if exist "%TEMP%" rd /s /q "%TEMP%"
mkdir "%TEMP%" || goto :error

cd /d "%TEMP%" || goto :error

echo.
echo GitHub からダウンロード中...
git clone https://github.com/GroundServicesJP/GroundServicesJP_GSXProfiles.git
if errorlevel 1 goto :error

echo.
echo ファイルを配置中...
move "%TEMP%\GroundServicesJP_GSXProfiles\*" "%BASE%\" >nul

cd /d "%BASE%"
rd /s /q "%TEMP%"

rem snjsim版お使いの際は、snjsim → keisim に変更してください
del rjft-snjsim.py 2>nul
del rjft-snjsim.ini 2>nul

rem Gate15_v2版お使いの際は、g15v2 → g15_marin に変更してください
del rjer-g15v2.py 2>nul
del rjer-g15v2.ini 2>nul

echo.
echo 完了しました
goto :end

:error
echo.
echo [ERROR] 処理中にエラーが発生しました
echo 途中で中断されています。ファイルを確認してください
pause

:end
chcp 932 >nul
endlocal
