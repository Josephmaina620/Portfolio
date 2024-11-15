@echo off
echo Gathering system information...

rem Serial Number
for /f "tokens=2 delims==" %%a in ('wmic bios get serialnumber /value') do set serial=%%a

rem Manufacturer
for /f "tokens=2 delims==" %%a in ('wmic computersystem get manufacturer /value') do set manufacturer=%%a

rem Model
for /f "tokens=2 delims==" %%a in ('wmic computersystem get model /value') do set model=%%a

rem Processor
for /f "tokens=2 delims==" %%a in ('wmic cpu get name /value') do set processor=%%a

rem RAM Capacity in Bytes (no conversion)
echo RAM Capacity (Bytes):
for /f "skip=1 tokens=1" %%a in ('wmic memorychip get capacity') do (
    if not "%%a"=="" (
        echo %%a bytes
    )
)

rem Operating System
for /f "tokens=2 delims==" %%a in ('wmic os get caption /value') do set os=%%a

rem MAC Address (First Network Adapter)
for /f "tokens=2 delims==" %%a in ('wmic nic where "netenabled=true" get macaddress /value') do set mac=%%a

rem Hard Drive Size in Bytes (no conversion)
echo Hard Drive Size (Bytes):
for /f "skip=1 tokens=1" %%a in ('wmic diskdrive get size') do (
    if not "%%a"=="" (
        echo %%a bytes
    )
)

echo.
echo ====== Computer Inventory ======
echo Serial Number: %serial%
echo Manufacturer: %manufacturer%
echo Model: %model%
echo Processor: %processor%
echo Operating System: %os%
echo MAC Address: %mac%
echo ================================
echo.

pause
