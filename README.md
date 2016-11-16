# 4LIVE

4LIVE is a scratchpad for keeping notes while you're working on your Apple II under DOS 3.3. The current version allows you to keep a 40x23 screen of freeform text, accessible at any time that DOS is in memory.

## System requirements

  * Apple II+ or later
  * 64K memory
  * DOS 3.3 or compatible third-party DOS (tested with Pronto-DOS, Diversi-DOS, and Diversi-DOS 64K)

### Memory usage

When you first run 4LIVE, it will load only a small code stub in low memory (in page 3, just below the DOS 3.3 vectors). This stub will load the rest of 4LIVE directly into $D000 in LC RAM bank 1. The stub clobbers the memory range $800-$8FF in main memory.

Thereafter, 4LIVE stays resident in page 3 ($300-$3CF) and in LC RAM bank 1 ($D000-$DFFF), but it does not clobber any other region in main memory.

4LIVE never uses LC RAM bank 2 or auxiliary memory.

## For users

Install 4LIVE by typing `BRUN _4LIVE` from the BASIC prompt, or by executing it as the last line of your `HELLO` program.

```10 PRINT CHR$(4);"BRUN _4LIVE"```

Now you can press `<Ctrl+@>` at any time to enter the 4LIVE editor. This works from the BASIC prompt or the monitor -- even in the middle of typing a command -- as long as DOS is in memory and connected. (If you can do a `CATALOG`, DOS is connected.)

Keyboard commands within the 4LIVE editor:

 * `<Ctrl+@>` or `<Esc>` exits the 4LIVE editor.
 * Arrows move freely up, down, left, and right. On an Apple II+, you can use `<Ctrl+K>` and `<Ctrl+J>` in place of up and down arrows.
 * `<Return>` moves the cursor to the beginning of the next line. It does not erase any text on the current line. It will wrap around from the bottom of the screen to the top.
 * `<Ctrl+N>` clears the editor screen and erases all your data.
 * `<Ctrl+I>` imports the "real" text screen you were looking at before you entered the editor (like taking a text screenshot). This overwrites the entire scratchpad and erases all your data.

4LIVE will automatically save the contents of your scratchpad on exit. (Currently it saves to the file `_4LIVE DATA`. You will see this file in the disk catalog.)

## For developers

4LIVE is written in 100% 6502 assembly language, but it is developed on modern PCs (not in a "classic" IDE like Merlin-8). The source code is stored and managed in text files. These text files are assembled to executable code with [ACME](https://sourceforge.net/projects/acme-crossass/), then transferred to a disk image (`.dsk` file) with [AppleCommander](http://applecommander.sourceforge.net/). You can mount this disk image in any Apple II emulator.

If you are on Mac OS X and have the [Virtual II](http://virtualii.com/) emulator, you can use the included Applescript to mount the `.dsk` file and reboot the emulator automatically. The included `Makefile` does this by default (after running ACME and AppleCommander).

Thus, during development, my testing cycle goes like this:

 1. Edit `.a` source code file in any modern text editor
 2. Run `make`
 3. Test in Virtual II
 4. GOTO 1

## Acknowledgments

Thanks to [Peter Ferrie, a.k.a. qkumba](https://github.com/peterferrie) for his many contributions to this project.

Thanks to [Quinn Dunki](https://github.com/blondie7575) for her help integrating the [Apple II build pipeline](https://github.com/blondie7575/Apple2BuildPipeline) into my development environment.
