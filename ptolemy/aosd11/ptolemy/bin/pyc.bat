@echo off

set %PYC_HOME%=""

if "%PYC_HOME%"=="" goto setDefaultPtolemyHome
goto compile

:setDefaultPtolemyHome
rem %~dp0 is expanded pathname of the current script under NT
echo PYC_HOME not found.  Setting to default %~dp0..
set PYC_HOME=%~dp0..

REM remove a final bin from PYC_HOME, if it exists


:compile
set PYC=%PYC_HOME%\bin\pyc.jar
set COMP_LIB=%PYC_HOME%\bin\pyc.jar
REM echo PYC_HOME: %PYC_HOME%
REM echo PYC: %PYC%
REM echo COMP_LIB: %COMP_LIB%

REM pass all the command line args used onto japyc
java -jar %PYC% -classpath .;%COMP_LIB% %*
