Set Region V1.0 - By The Welder/Faith^Paradox
---------------------------------------------

Introduction
------------

This is a small utility that enables you to alter the region of playstation RAW binary
images and therefore allow import titles to boot on the PS-One.  It only supports the
patching of RAW binary images, such as those produced by CDR duplicating programs such
as CDRWin.  Nero images have a custom format and therefore are not supported by this
utility.  (Since I haven't looked at the types of files produced by DiscJuggler or
CloneCD, I can't say as to whether this utility will work with these files!!)

The image that is to be patched is very simply verified as being true RAW and rejected
if its format does not comply with the RAW standard (2352 bytes/sector).

If you badly require this utility to support Nero, DiscJuggler or CloneCD binary files
then please contact me via email and I shall include support for them.

Usage
-----

SetRegion [<RAW binary file>] [REGION]

This utility is very easy to use as basically it only requires one argument to
function as default.  This argument being the file name of the image to patched.
However if only the filename is specified, the image will be patched by default to a
EURO/PAL image.

If you are specifying a path to a file that contains spaces, please include quotation
marks around the path/filename.

The second argument is the required region for the image.  This can either be PAL,
USA or JAP (non case-sensitive).

This utility *MUST* be run from an MS-Dos prompt and not simply double-clicked on
through Windoze.  It is simply a console application and contains no visual interface
whatsoever.  If I get enough requests for an interface, I'll write one.

That's it really!  Simple as that.

Lamer Examples Of Use
---------------------

1) To patch a JAP game to boot on a UK PS-One.  Assuming the image is:  Tekken.bin

	SetRegion Tekken.bin
or
	SetRegion Tekken.bin PAL
or
	SetRegion Tekken.bin pal

You should have noticed from the first example above, that this utility defaults to
PAL and so you actually need not explicitly specify it.  The second and third examples
show explicitly specifying the required region and demonstrating that this
specification is *NOT* case sensitive.

2) To patch a USA game to boot on a JAP PS-One.  Assuming the image is:
   C:\My Documents\PSX Images\Croc_2.bin

	SetRegion "C:\My Documents\PSX Images\Croc_2.bin" JAP

3) To patch a PAL game to boot on a US PS-One.  Assuming the image is:
   C:\Vagrant Story.bin

	SetRegion "C:\Vagrant Story.bin" usa

Technical Notes
---------------

* No known bugs that I am aware of.  (However how can you fuck up such a small piece of
				      C++ eh?)

Only the region sectors of the RAW image are adjusted, no other part of the image is
modified in any way whatsoever.  However, please note that the region sectors are
entirely re-written and not simply modified.  This means that if the sectors are
written back to CD in Disk-At-Once mode the EDC/ECC checksums are valid.  If you're
simply writing the data back to CD in standard RAW mode, these checksums are
re-calculated and written on the fly anyway.

Verification is done purely on the first 8 bytes of the binary image.

Memory requirements for this utility is 75k (including stack).

Total coding time: 3 hours (including a couple of required tools, 3 hours)

Disclaimer
----------

I take no resposibility whatsoever for any affect or sideeffect to the operating of
your computer that the use of this program may cause.  So basically what this means is:
If you use this utility and your entire computer explodes, blows your hands off and the
shrapnel from the blast kills your granny, don't come after me for compensation!

At the time of writing, this utility is bug and virus free.

This utility is freeware, so as far as I am comcerned, you can spread it all you like.
Charge your mates for it, or donate it to charity, it doesn't matter to me.  Unlike
most of the lame PC WANKERS out there, all my tools are FUCKING FREE.

- Let the AMIGA SPIRIT wash over your PC lame asses and figure out that coding is for
  fun and not for profit!

Contact
-------

If you want to contact me for any reason, hopefully not to slag off this program, then
simply email me at:
			welder@majesty.net

and I'll do my best to assist you in any way that I can.

- The Welder/Faith^Paradox.
