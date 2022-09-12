# SetRegion GUI

<p align="center"><img src="https://raw.githubusercontent.com/wad11656/SetRegion-GUI/main/ScreenShot.png" width="500"/></p>

### *Download is on the [Releases](https://github.com/wad11656/SetRegion-GUI/releases) Page.*

## About

This is a GUI version of the original <a href="https://www.consolecopyworld.com/psx/psx_utils_pn_cnv.shtml#SetRegion">SetRegion</a>.

### What does it do?
Converts the region sectors of PS1 `.bin` disc images into JAP, PAL, or USA without modifying the game's display resolution.

### Why?
Primarily used today to fix/increase certain PS1 games' compatibility on the PSP & Vita (Adrenaline) PS1 emulators.

### How does changing the region sectors help?
In the mid-2000s, the PSP homebrew scene discovered that assigning custom Game IDs to PS1 discs when creating an EBOOT (as opposed to using <a href="https://user-images.githubusercontent.com/16929664/189551050-48756bcd-da1f-4743-b8d4-7c8d4be223f4.png">their native IDs</a>) can increase compatibility on the PSP PS1 emulator. (This behavior carried over to the Vita too.)

However, starting with PSP firmware 5.00 and above, if you assigned a JAP Game ID to a USA or PAL game, the resulting EBOOT would become unbootable. Injecting JAP region sectors into the disc image(s) fixes this issue.

### Which games benefit from changing the region sectors?
Most of the games that benefit are already published for download online in EBOOT format. Otherwise, my most up-to-date [PSP PS1 Compatibility List is here](https://docs.google.com/spreadsheets/d/1ZE8d4WIw7USP_cYdEWUke5F59OFGQHgB5jGiQvfY8gA/edit?usp=sharing).

## Finding a game fix yourself
There's 4 methods that you can mix & match with each other to find a fix for a PS1 game on PSP/Vita:
1. **[POPSLoader](https://archive.org/details/popsloader-v-4i) (PSP Only)** - Allows you to boot your game through older builds of the PSP/Vita PS1 emulator (called "POPS"), potentially fixing your game. Try your game in all the builds listed in POPSLoader before trying custom GameIDs or region injection.
2. **LibCrypt Patch (PAL only)** - Use [PPF-O-Matic](https://www.romhacking.net/utilities/356/) to apply [your game's PPF patch](https://archive.org/details/lib-crypt-ppf-patches) to patch out any game-breaking protection mechanisms.
2. **Custom Game ID** - Changing this field in PSX2PSP to a Game ID of a different game can unlock special emulator settings tied to that Game ID, potentially fixing your game.
4. **Region Injection** - Only necessary if assigning a JAP GameID to a USA/PAL disc in PSX2PSP. (EBOOTs booted via POPSLoader v4.01 or below do not need this.)

### Game IDs proven to be helpful:

#### JAP region injection required for USA/PAL:
 - **SLPS-01222 & SLPS-01223 [Biohazard 2]**: Most fixes were found using these IDs. Can also increase framerate.
 - **SLPS-02190 & SLPS-02191 [Dragon Valor]**
 - **SLPM-86500 & SLPM-86501 [Dragon Quest VII]**
 - **SLPS-01724 [Mobile Suit Gundam - Char's Counterattack]**
 - **SLPS-01490 & SLPS-01491 [Brave Fencer Musashiden]**
 - **SLPS-01156 [Momotarou Dentetsu 7]**
 - **SLPS-02180 [Dino Crisis]**
 - The Game ID of the corresponding JAP variant of the game

#### No region injection required:
 - **SLES-00972 & SLES-00973 [Resident Evil 2 (PAL)]**
 - **SCUS-94640 [Syphon Filter 3]**
 - The Game ID of the corresponding PAL/USA variant of the game

*This list is likely incomplete.

## EBOOT Tips:

 - Check online for an EBOOT download of your game first. The region-sector-injected, GameID-fixed EBOOT is probably already there.
 - Make sure to combine multi-track/multi-`.bin` PS1 images into a single `.bin` with a tool like [CDMage Beta](https://www.videohelp.com/software/CDMage) first, before using this tool or PSX2PSP.
 - Always use a **Compression** setting above **0** (I prefer **9**) in PSX2PSP when creating an EBOOT.
   - **Compression 0** only occasionally works in low PSP firmwares.
 - Turn off **Theme Mode** when using PSX2PSP.
 - Your PSP firmware version--and custom firmware version--makes a difference in compatibility. All my PSP testing was done on custom firmware 6.61 PRO-C2. If you find discrepancies on your hardware vs. what I say here or on my [Compatibility List](https://docs.google.com/spreadsheets/d/1ZE8d4WIw7USP_cYdEWUke5F59OFGQHgB5jGiQvfY8gA/edit?usp=sharing), make sure to test your game(s) on 6.61 PRO-C2 first.
 - The name of an EBOOT folder must be less than 32 characters long.

## Game ID Tips:

### About "Game ID"
- Affects game compatibility.
- The ID used in the name of the save folder where your **single-disc EBOOT** save files are stored (`/PSP/SAVEDATA/<GAME_ID>/`).

### About "Main Game ID"
- Doesn't affect game compatibility.
- The ID used in the name of the save folder where your **multi-disc EBOOT** PS1 save files are stored (`/PSP/SAVEDATA/<MAIN_GAME_ID>/`).
- The ID recognized by plugins (e.g., POPSLoader & TempAR).

### Same Game ID Conflicts
- If you create multiple EBOOTs that share the same save folder (e.g., 2 single-disc EBOOTs with Game ID **SLPS-01222**), **DO NOT WORRY**--The save files from each game _will **NOT** overwrite each other_, but will simply store to the same Virtual Memory Cards in the same save folder (e.g., `/PSP/SAVEDATA/SLPS-01222/`).
<br/>Each save folder stores 2 Virtual Memory Cards, stored at `/PSP/SAVEDATA/<ID>/SCEVMC0.VMP` (Slot 1) and `/PSP/SAVEDATA/<ID>/SCEVMC1.VMP` (Slot 2).
  - However, EBOOTs that share the same save folder/Virtual Memory Cards will appear as a single entry in the XMB **Save Data Utility**, so you can't manage the saves for the individual games from there.
  - On PSP, you can open **Memory Card Utility** from within the emulator to manage the saves for the different games.
  - **Memory Card Utility** doesn't work (for me) on Vita (Adrenaline), so you can't manage the individual saves for the different games. As a workaround, you can force the Vita to create separate **Save Data Utility** entries/Virtual Memory Cards for each game (while still sharing the same Game ID). To do this, add a dummy/placeholder PS1 disc in PSX2PSP while making each EBOOT. Since the EBOOT is now multi-disc, the Vita will use the **Main Game ID** instead of the **Game ID** when creating the save folder/Virtual Memory Cards. (Obviously, make the **Main Game ID** of each EBOOT different from each other.)

## History
The download page on ConsoleCopyWorld dates SetRegion back to June 27, 2001. According to its brief description on that site, its original usage was to change the region sectors of foreign PS1 games to match the region of your own PS1 console so that you could then burn and play them on your real hardware.
<br/>
<br/>SetRegion came back into the homebrew scene in 2021 when I discovered that it could be used to inject JAP, PAL, or USA region sectors into <i>any</i> PS1 game, allowing me to discover fixes for several PS1 games that had never worked on PSP or Vita before. I quietly mentioned SetRegion and my brand new fixes on my <a href="https://docs.google.com/spreadsheets/d/13TRadnKyoOjzpxzMeVrO8adzbRNWccr5/edit?usp=sharing&ouid=106897808841980407300&rtpof=true&sd=true">Compatibility List</a>. <a href="https://gbatemp.net/members/the_ho.583322/">The_Ho</a> found this, and used SetRegion to find many more PS1 fixes for PSP and Vita.
