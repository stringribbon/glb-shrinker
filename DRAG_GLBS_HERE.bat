@echo off
set here=%~dp0

if "%1"=="" goto end

if not exist "%here%/compressed_output" mkdir "%here%/compressed_output"

:processglb
echo "About to unpack %1"
if not exist "%here%/tmp" mkdir "%here%/tmp"

:: empty tmp
del /f /s /q "%here%/tmp" 1>nul

:: unpack
call gltf-pipeline -i %1 -o "%here%/tmp/tmp.gltf" --separate --json

:: compress jpgs
echo y | call npx imagemin-cli "%here%/tmp/*.jpg" --plugin.mozjpeg --out-dir="%here%/tmp"

:: repack glb
call gltf-pipeline -i "%here%/tmp/tmp.gltf" -o "%here%/compressed_output/%~n1.glb" --binary --draco --draco.compressMeshes

:: move onto next item
echo:
shift
if "%1"=="" goto end
goto processglb

:end
echo "Processing complete! Compressed GLBs can be found in the compressed_output folder. Thank you for using GLB Shrinker"

:: get rid of tmp
if not exist "%here%/tmp" goto goodbye
del /f /s /q "%here%/tmp" 1>nul
rmdir /s /q "%here%/tmp"

:goodbye
pause