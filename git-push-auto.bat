@echo off
echo ========================================
echo   AUTO GIT PUSH (FULL AUTO)
echo ========================================
echo.

REM Tambahkan semua perubahan
echo [1/3] Menambahkan semua perubahan...
git add .
echo.

REM Commit dengan pesan otomatis
echo [2/3] Membuat commit otomatis...
git commit -m "Auto update portfolio - %date% %time%"
echo.

REM Push ke GitHub
echo [3/3] Push ke GitHub...
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
echo Script selesai dalam 3 detik...
timeout /t 3 /nobreak >nul
