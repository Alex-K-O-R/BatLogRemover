::MB Alex_K
@( Setlocal 
  @ECHO OFF
  FOR %%_ IN (%*) DO SET "%%~_"
)
CALL :main
( ENDLOCAL
  EXIT /B )

:main
Setlocal EnableDelayedExpansion
CALL :check_if_empty %depth
IF %check% == 0 (
 pause
 exit \b 128
)
CALL :check_if_empty %file_with_dirs_control
IF %check% == 0 (
 pause
 exit \b 128
)
set "file_with_dirs_control=%~dp0%file_with_dirs_control%"
rem [09011990]
rem IsMyBirthDay
IF DEFINED %look_for (
SET "look_for=%look_for:$=*%"
)

IF NOT DEFINED %look_for (
 set "look_for=*.log"
)

set "log_is=1"
IF NOT DEFINED %log_file (
 set "log_file=%~dp0FileCleanerLog.txt"
)

IF DEFINED %log_file (
	IF %log_file%==0 (
	set "log_is=0"
	)
	IF %log_file%==false (
	set "log_is=0"
	)
	set "log_file=%~dp0%log_file%"
)

if %log_is%==1 (
	set "LogTitle=%time%: launch with parameters "depth=%depth%" "file_with_dirs_control=%file_with_dirs_control%" "look_for=%look_for%" "log_file=%log_file%""
	IF not EXIST %log_file% (
		type nul>%log_file%
	)
	echo !LogTitle!>>"%log_file%" 
)


FOR /f "delims=" %%G in (%file_with_dirs_control%) DO (
	if not "%%G" == "" call :sub "%%G"
)

if %log_is%==1 (
	echo %time%: done.>>"%log_file%" 
	echo. >>"%log_file%" 
	echo. >>"%log_file%" 
	echo. >>"%log_file%" 
)
endlocal
pause
goto :EOF


:DEL_FOLDERS_GENERAL
setlocal
if %log_is%==1 (
	rem forfiles /p %1 /m %2 /s /D -%depth% /c "CMD /c echo @path>>%log_file%"
	forfiles /p %1 /m %2 /s /D -%depth% /c "cmd /c del /q @path & echo @path>>%log_file%"
)
if %log_is%==0 (
	forfiles /p %1 /m %2 /s /D -%depth% /c "cmd /c del /q @path"
)
rem forfiles /p %1 /m %2 /s /D -%depth% /c "CMD /c echo @path>>%log_file%"
endlocal
exit /b

:sub
setlocal
call :parse "%~1" "%look_for%"
endlocal
exit /b

:Parse
for /f "tokens=1* delims=," %%i in ("%~2") do (
    CALL :DEL_FOLDERS_GENERAL "%~1" "%%i"
    call :Parse "%~1" "%%j"
)
goto :eof


:check_if_empty
IF NOT DEFINED %1 (
echo Error! Mean parameter "%1%=" is not set.
echo.
set "check=0"
GOTO :EOF
)
IF DEFINED %1 (
	IF [%1] == [] (
	echo Error! Mean parameter "%1%=" is not set.
	echo.
	set "check=0"
	GOTO :EOF
	)
)
set "check=1"
GOTO :EOF
exit \b