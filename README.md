# Capstone_Spring2020
Collection of various Arduino sketches used to showcase dangers of plugging in untrusted USB devices.  Arduino sketches range from creating new accounts to disabling defender prior to executing meterpreter payloads.

Some resources we used:

Dukweeno DuckyScript to Arduino C Converter: https://dukweeno.github.io/Duckuino/

Github Repo: https://github.com/Dukweeno/Duckuino

Arduino IDE Software Download: https://www.arduino.cc/en/Main/Software

Installing the Arduino Addon(Win): https://learn.sparkfun.com/tutorials/pro-micro--fio-v3-hookup-guide/installing-windows

Installing the Arduino Addon(Linux/macOS): https://learn.sparkfun.com/tutorials/pro-micro--fio-v3-hookup-guide/all#installing-mac--linux

Board used for this project can be purchased here: https://www.amazon.com/KeeYees-ATmega32U4-Development-Microcontroller-Bootloader/dp/B07FXCTVQP

# Brief overview of sketches:

EvilAdmin:
----------
Creates malicious account. Grabs current admins with glgm cmd-let.  Removes prexisting admins from admin localgroup (I hard coded the acct names for admin localgroup removal).  Adds maliciously created accout to admin localgroup.


msfQuack:
---------
Uses combination of existing cmd.exe commands and PowerShell cmd-lets to disable windows defender prior to downloading and executing meterpreter payload (inspired by work done by Dan Tentler and utilizes AMSI bypass developed by Matt Graeber).
msfQuack demo: 
https://youtu.be/RO6N1sgkqbM

ezShell:
--------
Utilizes PowerShell to create exclusion path.  Creates PowerShell script to run wget request to download meterpreter payload.  Runs PowerShell script in background to execute meterpreter payload.


# Note
No plans to maintain and will likely archive after 20200513.  

# .ps1 files
PowerShell script files (denoted by '.ps1') were written by Daniel Contreras (windefend.ps1) and me (testScript.ps1) in an effort to thwart our attempts to disable Defender (msfQuack.ino and killDefend.ps1).  Unfortunately we ran out of time before we had to present our findings and had to abandon development.


