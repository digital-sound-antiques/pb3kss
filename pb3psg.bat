REM 
REM  Require playball3.dsk, bincut2.exe, readdsk.exe
REM
REM zasm -Cpb3psg pb3psg.asm

readdsk playball3.dsk PSG.BIN FM*.BIN ENDPSG.BIN
bincut2 -o pb3psg.bin -l 200 pb3psg.com
copy /B PSG.BIN + FM0.BIN drv.bin
copy /B FM1.BIN + FM2.BIN + FM3.BIN + FM4.BIN + FM5.BIN + ENDPSG.BIN bgm.bin
copy /B pb3psg.hed + pb3psg.bin + drv.bin + bgm.bin pb3psg.kss

del PSG.BIN
del ENDPSG.BIN
del FM*.BIN
del drv.bin
del bgm.bin

