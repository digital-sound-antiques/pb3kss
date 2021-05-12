REM 
REM  Require playball3.dsk, bincut2.exe, readdsk.exe
REM
REM zasm -Cpb3fm pb3fm.asm
REM

readdsk playball3.dsk OPLL*.BIN ENDOPLL.BIN
bincut2 -o pb3fm.bin -l 200 pb3fm.com
copy /B OPLL.BIN + OPLL0.BIN bgm1.bin
copy /B OPLL1.BIN + OPLL2.BIN + OPLL3.BIN + OPLL4.BIN + OPLL5.BIN + ENDOPLL.BIN bgm2.bin
copy /B pb3fm.hed + pb3fm.bin + bgm1.bin + bgm2.bin pb3fm.kss

del OPLL*.BIN
del ENDOPLL.BIN
del bgm1.bin
del bgm2.bin

