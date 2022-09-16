# SetRegion GUI

<p align="center"><img src="https://raw.githubusercontent.com/wad11656/SetRegion-GUI/main/README%20assets/ScreenShot.png" width="500"/></p>

### *Download is on the [Releases](https://github.com/wad11656/SetRegion-GUI/releases) Page.*

## About

This is a GUI version of the original <a href="https://www.consolecopyworld.com/psx/psx_utils_pn_cnv.shtml#SetRegion">SetRegion</a>.

### What does it do?
Converts the region sectors of PS1 `.bin` disc images into JAP, PAL, or USA without modifying the game's display resolution.

### Why?
Primarily used today to fix/increase certain PS1 games' compatibility on the PSP & Vita-Adrenaline PS1 emulators.

### How does changing the region sectors help?
In the mid-2000s, the PSP homebrew scene discovered that assigning custom Game IDs to PS1 discs when creating an EBOOT (as opposed to using <a href="https://raw.githubusercontent.com/wad11656/SetRegion-GUI/main/README%20assets/Game%20ID%20Example.png">their native IDs</a>) can increase compatibility on the PSP PS1 emulator. (This behavior carried over to the Vita too.)

However, starting with PSP firmware 5.00, if you assigned a JAP Game ID to a USA or PAL game, the resulting EBOOT would become unbootable. Injecting JAP region sectors into the disc image(s) with SetRegion fixes this issue, allowing custom JAP Game IDs to be used on USA/PAL games on PSP FW 5.00 and above. Since Vita-Adrenaline emulates a form of PSP firmware 6.61, this discovery allows JAP Game IDs to be used (and thus new game fixes to be found) on both PSP FW 5.00+ & Vita.

### Which games benefit from changing the region sectors?
Most of the games that benefit are already published for download online in EBOOT format. Otherwise, my most up-to-date [PSP PS1 Compatibility List is here](https://docs.google.com/spreadsheets/d/13TRadnKyoOjzpxzMeVrO8adzbRNWccr5/edit?usp=sharing&ouid=106897808841980407300&rtpof=true&sd=true) and [The_Ho](https://gbatemp.net/members/the_ho.583322/)'s [thread where new game fixes are discussed is here](https://gbatemp.net/threads/new-mode-to-fix-ps1-games-for-psp-and-psvita.607286/). (I am planning on making a website compiling all Vita/PSP compatibility fixes from myself and The_Ho.)

## Finding a game fix yourself
There's 5 methods that you can mix & match with each other to find a fix for a PS1 game on PSP/Vita:
1. **[POPSLoader](https://archive.org/details/popsloader-v-4i) (PSP Only)** - Allows you to boot your game through older builds of the PSP PS1 emulator (called "POPS"), potentially fixing your game. Try your game in all the builds listed in POPSLoader before trying custom GameIDs or region injection.
2. **LibCrypt Patch (PAL only)** - Use [PPF-O-Matic](https://www.romhacking.net/utilities/356/) to apply [your game's PPF patch](https://archive.org/details/lib-crypt-ppf-patches) to patch out any game-breaking protection mechanisms.
   -  Unlike modern PS1 emulators, the PSP/Vita does _not_ automatically patch out LibCrypt protection.
3. **Custom Game ID** - Changing this field in PSX2PSP to a Game ID of a different game can unlock special emulator settings tied to that Game ID, potentially fixing your game.
4. **Region Injection** - Only necessary if assigning a JAP GameID to a USA/PAL disc in PSX2PSP.
   - USA/PAL EBOOTs with JAP Game IDs that are booted via POPSLoader v4.01 or below do not need region injection, but if you're actively hunting for a game fix, you should always just region-inject your game anyway so you can test JAP Game IDs on POPSLoader firmwares above 4.01 too.
5. **Disc Image Hacking** - When custom Game IDs and Region Injection fails, hacking the disc image may be the only possible fix.
   - For example, The_Ho created a new fix for _Jackie Chan Stuntmaster_ by editing out the FVMs on the disc with a hex editor, and I found one for _Worms_ by exporting the FMV files in CDMage, overwriting the hex values of all the FMVs with `0`s using a hex editor, then importing back into CDMage. (FMV playback seems to be a relatively common pitfall for the emulator.)

### Game IDs proven to be helpful:

#### IDs where JAP region injection is required for USA/PAL games:
 - **SLPS-01222 & SLPS-01223 [Biohazard 2]**: Most fixes were found using these IDs. Can also increase framerate.
 - **SLPS-02190 & SLPS-02191 [Dragon Valor]**
 - **SLPM-86500 & SLPM-86501 [Dragon Quest VII]**
 - **SLPS-01724 [Mobile Suit Gundam - Char's Counterattack]**
 - **SLPS-01490 & SLPS-01491 [Brave Fencer Musashiden]**
 - **SLPS-01156 [Momotarou Dentetsu 7]**
 - **SLPS-02180 [Dino Crisis]**
 - The Game ID of the JAP variant of the game

#### IDs where no region injection is required:
 - **SLES-00972 & SLES-00973 [Resident Evil 2 (PAL)]**
 - **SCUS-94640 [Syphon Filter 3]**
 - The Game ID of the PAL/USA variant of the game

*This list is incomplete. [You can also try the POPS Binaries Game IDs](https://github.com/wad11656/SetRegion-GUI/blob/main/README%20assets/POPS%20Binaries%20Game%20IDs.md).

#### Game ID Tips:
- Try Game IDs on different POPSLoader versions, too.
- If none of these Game IDs help, try Game IDs not listed here.
  - JAP Game IDs seem most useful.

## EBOOT Tips:

 - Check online for an EBOOT download of your game first. The working EBOOT (with region sectors injected and/or modified Game ID, if necessary,) is probably already there.
 - Make sure to combine multi-track/multi-`.bin` PS1 images into a single `.bin` with a tool like [CDMage Beta](https://www.videohelp.com/software/CDMage) first, before using this tool or PSX2PSP.
 - Always use a **Compression** setting above **0** (I prefer **9**) in PSX2PSP when creating an EBOOT.
   - **Compression 0** only occasionally works on low PSP firmwares. It's probably best to just avoid it.
 - Turn off **Theme Mode** when using PSX2PSP.
 - Your PSP firmware version--and custom firmware version--makes a difference in compatibility. All my PSP testing was done on custom firmware 6.61 PRO-C2. If you find discrepancies on your hardware vs. what I say here or on my [Compatibility List](https://docs.google.com/spreadsheets/d/13TRadnKyoOjzpxzMeVrO8adzbRNWccr5/edit?usp=sharing&ouid=106897808841980407300&rtpof=true&sd=true), make sure to test your game(s) on 6.61 PRO-C2 first.
 - The name of an EBOOT folder must be less than 32 characters long.
 - (Multi-track/`.bin` games only) On firmwares 5.00 and above on PSP, one must use the [CDDA Enabler](https://archive.org/details/cdda_enabler_v2) plugin to enable CDDA audio. This plugin is not perfect and sometimes causes games to crash when playing certain audio tracks. However, since the Vita's PS1 emulator uses a different method of enabling CDDA audio, the same audio tracks often do _not_ make Vita-Adrenaline crash.
   - Try PSP firmwares 4.01 and below via POPSLoader to bypass crashes caused by the CDDA Enabler plugin.

## Game ID Tips:
[This is where a PS1 game's Game ID & Main Game ID come from.](https://raw.githubusercontent.com/wad11656/SetRegion-GUI/main/README%20assets/Game%20ID%20Example.png)

### EBOOT "Game ID"
- Affects game compatibility.
- The ID used in the name of the save folder where your **single-disc EBOOT** save files/Virtual Memory Cards are stored (`/PSP/SAVEDATA/<GAME_ID>/`).

### EBOOT "Main Game ID"
- Doesn't affect game compatibility.
- The ID used in the name of the save folder where your **multi-disc EBOOT** save files/Virtual Memory Cards are stored (`/PSP/SAVEDATA/<MAIN_GAME_ID>/`).
- The ID recognized by plugins (e.g., POPSLoader & TempAR).

### Duplicate "Game ID" Save Conflicts
- Each save folder stores 2 Virtual Memory Cards, stored at `/PSP/SAVEDATA/<ID>/SCEVMC0.VMP` (Slot 1) and `/PSP/SAVEDATA/<ID>/SCEVMC1.VMP` (Slot 2).
- If you create multiple EBOOTs that share the same save folder (e.g., 2 single-disc EBOOTs with Game ID `SLPS-01222`), **DO NOT WORRY**--The save files from each game _will **NOT** overwrite each other_, but will simply store to the same Virtual Memory Cards in the same save folder (e.g., `/PSP/SAVEDATA/SLPS-01222/`).
- EBOOTs that share the same save folder/Virtual Memory Cards will appear as a single entry in the XMB **Save Data Utility**, so you can't separately manage the saves for the individual games from there.
- On PSP, you can open **Memory Card Utility** from within the emulator to manage the saves for the individual games.
- **Memory Card Utility** doesn't work (for me) on Vita-Adrenaline, so you can't manage the saves for the individual games from there. As a workaround, you can force the Vita to create separate save folders/**Save Data Utility** entries for each game (while still sharing the same Game ID).
  - To do this, add a dummy/placeholder PS1 disc in the **Disc 2** slot in PSX2PSP while making each EBOOT. (It can just be a blank text file named `0.bin`/`0.img`/`0.iso` that you assign any Game ID, like `SLUS-00000`.) Since the EBOOT is now multi-disc, the Vita will use the **Main Game ID** instead of the **Game ID** when creating the save folder/Virtual Memory Cards/**Save Data Utility** entries.
    - Obviously, make the **Main Game ID** of each of the EBOOTs different from each other for this hack to work.
    - Also, never accidentally switch to a blank dummy disc in the emulator or it will make your EBOOT unbootable.
    
## History

The download page on ConsoleCopyWorld dates SetRegion back to June 27, 2001. According to its brief description on that site, its original usage was to change the region sectors of foreign PS1 games to match the region of your own PS1 console so that you could burn and play them.

The original discovery of injecting region sectors to increase PS1 compatibility on PSP/Vita might be credited to the Brazilians: I only was inspired to find a tool like SetRegion in the first place because I noticed that a Portuguese fan-translation EBOOT of Valkyrie Profile (PS1)—which was translated from the USA version of the game—was booting on my PSP using the Japanese BIOS (and using a Japanese Game ID). As a result, the game avoided a crash that usually plagues the USA version of the game on PSP/Vita. So, I went hunting for a tool that could change the reigion of PS1 games so that I could trigger the PSP/Vita to use the Japanese BIOS and potentially fix other USA games as well.

As a result, SetRegion came back into the homebrew scene in 2021 when I discovered that it indeed could be used to inject JAP, PAL, or USA region sectors into <i>any</i> PS1 game, allowing me to—in conjuction with using JAP Game IDs that the homebrew scene had found before me—discover fixes for several PS1 games that had never worked on PSP or Vita before, which I quietly published in my [Compatibility List](https://docs.google.com/spreadsheets/d/13TRadnKyoOjzpxzMeVrO8adzbRNWccr5/edit?usp=sharing&ouid=106897808841980407300&rtpof=true&sd=true). 

Interestingly, <a href="https://gbatemp.net/members/the_ho.583322/">The_Ho</a> also made the same discovery of region injection several months later, and [found game fixes](https://gbatemp.net/threads/new-mode-to-fix-ps1-games-for-psp-and-psvita.607286/) by manually migrating region sector hex values between disc images. He later found my Compatibility List and then used SetRegion to streamline his process in finding many more breakthrough PS1 fixes for PSP and Vita.
