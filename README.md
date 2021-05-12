# Playball3 KSS Ripper

# Files
|FILE|DESCRIPTION|
|----|----|
|img/|Folder for required image files (see the next section)|
|pb3{fm,psg}.asm|Assembler source of pg3{fm,psg}.bin|
|pb3{fm,psg}.hed|KSS header binary|
|pb3{fm,psg}.bat|batch to generate fm.kss|
|pb3{fm,psg}.pls|playlist file for Winamp (Japanese Shift-JIS)|

# How to Use
## Prerequisites
Rip the following files from your Playball3 disk image and put them into the `./img` folder.

- OPLL.BIN, OPLL0.BIN, OPLL1.BIN, OPLL2.BIN, OPLL3.BIN, OPLL4.BIN, OPLL5.BIN, ENDOPLL.BIN
- PSG.BIN, FM0.BIN, FM1.BIN, FM2.BIN, FM3.BIN, FM4.BIN, FM5.BIN , ENDPSG.BIN

## Build KSS
Then run the following batch files from Windows Command Prompt to create .kss files.

```
\pb3kss> pb3fm.bat
\pb3kss> pb3psg.bat
```

# How to Compile .asm to .bin
This is advanced topic for, not required if you want to build just .kss files.

## 1. Prepare ZASM assembler
[ZASM for Windows](https://www.vector.co.jp/soft/dos/prog/se010314.html) is required to compile pb3{fm,psg}.asm to pb3{fm,psg}.bin. ZASM is very old MS-DOS application so [MS-DOS Player](http://takeda-toshiya.my.coocan.jp/msdos/) can be used to generate ZASM for your Windows 10 environment.

```
\pb3kss> msdos -Czasm64.exe ZASM.EXE
```

## 2. Prepare bincut2.exe
Download [bincut2.1](http://nezplug.sourceforge.net/) and put `bincut2.exe` to this folder.

### 3. Compile
```
\pb3kss> compile.bat
```