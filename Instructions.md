# General guidelines #

  * The spreadsheet "DatsvilleChecklist.xls" in the "svn\wiki" directory contains my list of tasks and notes that need to be done. Check it to see my progress.
  * Building, vehicle and minifigure models should be centered and sitting upon the origin. Use axis32x.dat too help orient models.
  * Inlined sub-models should be extracted and the parent model turned into an MPD file.
  * Inlining of sub-models should be avoided in general.
  * Models should ideally not contain minifigures or vehicles. Instead, minifigures and vehicles should be extracted and copied into "layer\_traffic.ldr" if possible.
  * Vehicles may contain minifigures, however.
  * Models should not contain part primitives. Part primitives should be replaced with official parts when they become available, or copied into a new file or sub-model of an MPD file if not available.
  * All baseplates should be replaced with SNOT roads or tiled regions except the pink and teal "guide" baseplates used for orienting models.
  * Buildings should have interiors including beds, appliances, stairs, etc..
  * Unparked vehicles should have drivers.
  * Minifigures should not be re-used. All minifigures should be unique, even if they are identical visually.
  * There is a separate directory for "boxed" versions of models created using LDBoxer. Do not keep them in the main directory.
  * Unix operating systems as well as some Windows software are case-sensitive. So make sure that the capitalization is the same everywhere. I've been typing all names in lower-case.

# Making maps using POV-Ray #

  1. Copy the contents of "svn\trunk\datsville" to "svn\trunk\datsville\_boxed", overwriting any files if asked.
  1. Execute "svn\trunk\helper\_scripts\myboxer\myboxer\_convert\_datsville\_boxed.bat". This will "boxify" the models in that directory.
  1. Convert the "boxed" LDraw models to POV-Ray format by executing "l3p\_convert\_datsville\_boxed.cmd" in the "svn\trunk\helper\_scripts\povray" directory. This will produce a file called "datsville.pov".
  1. Open "datsville.pov" in POV-Ray 3.7. You will probably need to install the 64 bit version of POV-Ray as Datsville consumes huge amounts of RAM.
  1. Add the strings "#version 3.7;" and "#include "ldr\_wrapper\_mapview\_1.4.inc"" to the top of the POV-Ray file.
  1. Delete any camera and light statements. Also delete all the color and material definitions in the "Defines" section.
  1. Render the scene at 8192x4096 pixels. This will produce the isometric image I use in my town maps. You'll need a lot of RAM, but it won't take a lot of time to render once it's done parsing. You should probably also render Datsville with the "+q7" flag set when creating the maps.