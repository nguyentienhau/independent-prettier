@ECHO off
GOTO start
:find_dp0
SET dp0=%~dp0
EXIT /b
:start
SETLOCAL
CALL :find_dp0

IF EXIST "%dp0%\bin\node.exe" (
	SET "_prog=%dp0%\bin\node.exe"
) ELSE (
	SET "_prog=node"
	SET PATHEXT=%PATHEXT:;.JS;=;%
)

set settings=--config "%dp0%\.prettierrc.json" --ignore-path "%dp0%\.prettierignore"

endLocal & goto #_undefined_# 2>NUL || title %COMSPEC% & "%_prog%"  "%dp0%\bin\prettier.cjs" %* %settings%
