copy /B img\OPLL.BIN + img\OPLL0.BIN bgm1.bin
copy /B img\OPLL1.BIN + img\OPLL2.BIN + img\OPLL3.BIN + img\OPLL4.BIN + img\OPLL5.BIN + img\ENDOPLL.BIN bgm2.bin
copy /B pb3fm.hed + pb3fm.bin + bgm1.bin + bgm2.bin pb3fm.kss

del bgm1.bin
del bgm2.bin
