@echo off
echo Starting convert... (output must be avi)
timeout /t 2 >nul /nobreak
if "%3"=="" ffmpeg -f u8 -ar 45000 -ac 2 -i %1 -f rawvideo -pix_fmt rgb555 -r 50 -s 30x30 -i %1 -vf scale=w=32*iw:h=32*ih:sws_flags=neighbor -b:v 50000k %2 -y
if "%3"=="laggy" ffmpeg -f u8 -ar 44100 -ac 2 -i %1 -f rawvideo -pix_fmt rgb555 -r 25 -s 42x42 -i %1 -vf scale=w=32*iw:h=32*ih:sws_flags=neighbor -b:v 50000k %2 -y
cls
echo Convert done! File: %2!
pause