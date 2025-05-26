@echo off
echo Launching CloudFront cache invalidation...
powershell -ExecutionPolicy Bypass -File "invalidate-distribution.ps1"
echo.
echo Script finished. Press any key to exit.
pause >nul