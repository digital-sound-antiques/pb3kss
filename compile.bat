zasm64 -Z -Cpb3psg.com src\pb3psg.asm
zasm64 -Z -Cpb3fm.com src\pb3fm.asm

bincut2 -o pb3fm.bin -l 200 pb3fm.com
bincut2 -o pb3psg.bin -l 200 pb3psg.com
