@echo off
title Oramic Setup Server
set /p x=Archive (for example app.zip): 
set /p z=Folder (for example SxS): 

:: ���������, ���������� �� �����
if not exist "%x%" (
    echo Error: Archive "%x%" not found!
    pause
    exit
)

:: ������ VBScript ��� ����������
echo Set objShell = CreateObject("Shell.Application") > unzip.vbs
echo Set source = objShell.NameSpace("%CD%\%x%") >> unzip.vbs
echo Set target = objShell.NameSpace("%CD%\%z%") >> unzip.vbs
echo For Each file In source.Items >> unzip.vbs
echo target.CopyHere file, 16 >> unzip.vbs
echo Next >> unzip.vbs

:: ������ ����� ��� ����������, ���� � ���
if not exist "%z%" mkdir "%z%"

:: ��������� VBScript
cscript //nologo unzip.vbs

:: ������� ��������� VBS-������
del unzip.vbs

echo Extraction completed!
pause