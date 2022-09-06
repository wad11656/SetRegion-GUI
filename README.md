# SetRegion GUI

<p align="center"><img src="https://raw.githubusercontent.com/wad11656/SetRegion-GUI/main/ScreenShot.png" width="500"/></p>

### *Download is on the [Releases](https://github.com/wad11656/SetRegion-GUI/releases) Page.*

## About
Convert the region sectors of PS1 `.bin` disc images into JAP, PAL, or USA without modifying the game's display resolution.

Primarily used today to fix/increase certain PS1 games' compatibility on the PSP & Vita (Adrenaline) PS1 emulators.
<br/>The emulators choose which region of BIOS to run the game under based on the `.bin`'s region sectors. After injecting foreign region sectors into a game, the corresponding foreign BIOS will sometimes emulate the game better than the native BIOS.

## EBOOT Tips:

 - Check CDRomance for an EBOOT download of your game first. The region-sector-injected, GameID-fixed EBOOT is probably already there.
 - Make sure to combine multi-track/multi-`.bin` PS1 images into a single `.bin` with a tool like [CDMage Beta](https://www.videohelp.com/software/CDMage) first, before using this tool or PSX2PSP.
 - Always use **Compression 9** in PSX2PSP when creating an EBOOT.
   - [The_Ho](https://gbatemp.net/members/the_ho.583322/) says to use **Compression 1**. As long as it's above 0.
 - Turn off **Theme Mode** when using PSX2PSP.
 - Games that need region-changing often aditionally equire a custom `GameID` in PSX2PSP when making the EBOOT. Check the newest [PSP PS1 Compatibility List](https://docs.google.com/spreadsheets/d/1ZE8d4WIw7USP_cYdEWUke5F59OFGQHgB5jGiQvfY8gA/edit?usp=sharing) for more info.

<details><summary><h2>History</h2></summary>
This is a GUI version of the original <a href="https://www.consolecopyworld.com/psx/psx_utils_pn_cnv.shtml#SetRegion">SetRegion</a>, which ConsoleCopyWorld dates back to June 27, 2001. According to its brief description on that site, its original usage was to change the region sectors of imported PS1 games to match the region of your own PS1 console, so that you could then burn your imported games to disc, then play those imported games on your real hardware.
<br/>
<br/>SetRegion came back into utility for the gaming homebrew scene in 2021 when I discovered that it could be used to inject JAP, PAL, or USA region sectors into <i>any</i> PS1 game, thus increasing game compatibility on the PSP and Vita (Adrenaline) PS1 emulators. 
<br/>
<br/>How could injecting different region sectors increase PS1 emulator compatibility? You see, the PS1 emulator on PSP & Vita uses a different set of BIOS for the games from each region, and the region sectors on a PS1 image is what triggers the emulator into determining which BIOS to use. For example, if you use SetRegion to inject a USA PS1 image with Japanese region sectors, the PSP & Vita PS1 emulators will run the game using the Japanese BIOS, whereas it would (of course) normally use the USA BIOS.
<br/>
<br/>For several USA/PAL games, using the Japanese BIOS is essential to getting the game to work. In other cases, using the Japanese BIOS can simply increase a game's compatibility or performance (speed).
<br/>
<br/>I can't take all the credit for this discovery, though: I was inspired to look for this tool after being directed to an EBOOT of a Portuguese translation of Valkyrie Profile (PS1) that launched on my PSP with the Japanese BIOS screen. This made me think that they somehow injected Japanese region sectors into the EBOOT's ISO in order to fix the game's compatibility on the PSP/Vita emulator. (I later decided that they must have extracted the region sectors from the NTSC-J Valkyrie Profile disc image and inserted them into the NTSC-U Portuguese-translated disc image.) So, I spent some hours digging around the internet for a tool that could inject region sectors, until I finally landed on the beloved SetRegion app.
<br/>
<br/>This region-sector-injection discovery led to me making multiple fixes for games on the PSP PS1 emulator for the first time in the world that were previously unplayable. I quietly added these fixes to <a href="https://docs.google.com/spreadsheets/d/13TRadnKyoOjzpxzMeVrO8adzbRNWccr5/edit?usp=sharing&ouid=106897808841980407300&rtpof=true&sd=true">my compatibility spreadsheet</a>, waiting until I'd made a website to display the information and show off my exciting discoveries to the public, basking in admiration. Little did I know, <a href="https://gbatemp.net/members/the_ho.583322/">The_Ho</a> would <a href="https://gbatemp.net/threads/new-mode-to-fix-ps1-games-for-psp-and-psvita.607286/">also discover this region-changing hack</a> for PS1 game compatibility just a few months later, and publicly announce this information to the internet that I'd been keeping kind of a secret. However, he didn't know about SetRegion at the time and <a href="https://www.reddit.com/r/PSP/comments/il1pqv/comment/i2nm5nz/?utm_source=share&utm_medium=web2x&context=3">was manually transferring region sectors from one version of the game to another</a>. He then found <a href="https://www.reddit.com/r/PSP/comments/il1pqv/wip_661_proc_psx2psp_compatibility_list_ntscu/">my compatibility spreadsheet Reddit post</a>, where he learned about SetRegion's mangnificence and the game fixes I'd found using it so far. He then took SetRegion and ran with it, discovering other fixes that I couldn't have without his help, (and releasing them to the public immediately unlike me), and is now credited for all the new 2022 PS1 game fixes for PSP & Adrenaline that you see on GBATemp and CDRomance. That's what I get for keeping these discoveries and game fixes (kind of) to myself!
</details>
