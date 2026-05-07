@echo off
echo ========================================
echo   AUTO GIT PUSH SCRIPT
echo ========================================
echo.

REM Cek status git
echo [1/4] Mengecek status git...
git status
echo.

REM Tambahkan semua perubahan
echo [2/4] Menambahkan semua perubahan...
git add .
echo Semua file berhasil ditambahkan!
echo.

REM Commit dengan pesan
echo [3/4] Membuat commit...
set /p commit_message="Masukkan pesan commit (tekan Enter untuk pesan default): "

if "%commit_message%"=="" (
    set commit_message=Update portfolio - %date% %time%
)

git commit -m "%commit_message%"
echo.

REM Push ke GitHub
echo [4/4] Push ke GitHub...
git push origin main
echo.

if %errorlevel% equ 0 (
    echo ========================================
    echo   BERHASIL! Perubahan sudah di GitHub
    echo ========================================
) else (
    echo ========================================
    echo   ERROR! Push gagal, cek koneksi internet
    echo ========================================
)

echo.
pause
