#!/bin/sh

# Setup the registry
wine regedit htmlhelp.reg

# Install HTML Help Workshop
wget -N 'http://go.microsoft.com/fwlink/?LinkId=14188'
WINEDLLOVERRIDES="advpack=n" wine htmlhelp.exe

# Install ITSS.DLL
cabextract -F hhupd.exe htmlhelp.exe
cabextract -F itss.dll hhupd.exe
cp -a itss.dll ~/.wine/drive_c/windows/system32/

# Install MFC40.DLL
wget http://activex.microsoft.com/controls/vc/mfc40.cab
cabextract mfc40.cab
wine mfc40.exe
