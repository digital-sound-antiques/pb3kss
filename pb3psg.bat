copy /B img\PSG.BIN + img\FM0.BIN drv.bin
copy /B img\FM1.BIN + img\FM2.BIN + img\FM3.BIN + img\FM4.BIN + img\FM5.BIN + img\ENDPSG.BIN bgm.bin
copy /B pb3psg.hed + pb3psg.bin + drv.bin + bgm.bin pb3psg.kss

del drv.bin
del bgm.bin
