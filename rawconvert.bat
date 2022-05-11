@echo off
echo Starting convert... (output must be avi)
timeout /t 2 >nul /nobreak
if "%3"=="rgb5551" ffmpeg -f u8 -ar 45000 -ac 2 -i %1 -f rawvideo -pix_fmt rgb555 -r 50 -s 30x30 -i %1 -vf scale=w=32*iw:h=32*ih:sws_flags=neighbor -b:v 50000k %2 -y
if "%3"=="rgb5552" ffmpeg -f u8 -ar 44100 -ac 2 -i %1 -f rawvideo -pix_fmt rgb555 -r 25 -s 42x42 -i %1 -vf scale=w=32*iw:h=32*ih:sws_flags=neighbor -b:v 50000k %2 -y
if "%3"=="rgb32" ffmpeg -f rawvideo -pixel_format rgb32 -video_size 32x32 -framerate 10.766666 -i %1 -f u8 -ar 44100 -ac 1 -i %1 -sws_flags neighbor -s 240x240 %2
if "%3"=="rgb8" ffmpeg -f rawvideo -pixel_format rgb8 -video_size 32x32 -framerate 10.766666 -i %1 -f u8 -ar 11025 -ac 1 -i %1 -sws_flags neighbor -s 240x240 %2
if "%3"=="rgb24" ffmpeg -f rawvideo -pixel_format rgb24 -video_size 32x32 -framerate 11.07 -i %1 -f u8 -ar 34000 -ac 1 -i %1 -sws_flags neighbor -s 240x240 %2
cls
echo Convert done! File: %2!
pause
