# FOR NON-STEPPED TERRAIN #

  1. Open "worldmachine\_project.tmd" in World Machine or create a new project.
  1. In World Machine select "World Commands" > "Project World Parameters...".
  1. In the "Render Extents and Normal Build Resolution" tab make sure that the "Resolution" setting is set to 128x128 and that the "+1" box is checked. Checking the "+1" box will change the resolution to 129x129. This is OK.
  1. Also make sure that the "Lower Left Coordinate" setting is set to 0.000000 and 0.000000 and that the "Upper Right Coordinate" setting is set to 1.000000 and 1.000000.
  1. In the "General Setup" tab make sure that the "Maximum Elevation" setting is set to 1.000000 and that the "Base Elevation" setting is set to 0.000000.
  1. Also make sure that the "Dimensionality" setting is set to "World Machine Units".
  1. Continue to tweak the other heightfield parameters if you want. Then export from World Machine as "worldmachine\_output.obj".
  1. Open "worldmachine\_output.obj" in MeshLab.
  1. In MeshLab select "Filters" > "Normals, Curvatures and Orientation" > "Transform: Move, Translate, Center". Check the "translate center of bbox to the origin" box and click "Apply" then "Close".
  1. In MeshLab select "Filters" > "Normals, Curvatures and Orientation" > "Transform: Rotate". Set the Rotation angle to 90 degrees around the x-axis and click "Apply" then "Close".
  1. In MeshLab select "Filters" > "Normals, Curvatures and Orientation" > "Transform: Scale". Uncheck the "Uniform Scaling" box. Then set the X Axis value to 81920, the Y Axis value to 30720, and the Z Axis value to 81920. Click "Apply" then "Close". This dialog is a bit buggy so you will have trouble entering the scaling values.
  1. In MeshLab select "File" > "Export Mesh As...". Export the file as "meshlab\_output\_nosteps.stl".
  1. Using the command prompt or a batch file convert the STL file to LDR using "stl2dat.exe". An example of the command line looks like this: `stl2dat meshlab_output_nosteps.stl -ldr -raw`
  1. Open the model in MLCAD. The model may be upside-down, so rotate 180 degrees around the x-axis if needed.


# FOR STEPPED TERRAIN #

  1. Open "worldmachine\_project.tmd" in World Machine or create a new project.
  1. In World Machine select "World Commands" > "Project World Parameters...".
  1. In the "Render Extents and Normal Build Resolution" tab make sure that the "Resolution" setting is set to 128x128 and that the "+1" box is checked. Checking the "+1" box will change the resolution to 129x129. This is OK.
  1. Also make sure that the "Lower Left Coordinate" setting is set to 0.000000 and 0.000000 and that the "Upper Right Coordinate" setting is set to 1.000000 and 1.000000.
  1. In the "General Setup" tab make sure that the "Maximum Elevation" setting is set to 1.000000 and that the "Base Elevation" setting is set to 0.000000.
  1. Also make sure that the "Dimensionality" setting is set to "World Machine Units".
  1. Continue to tweak the other heightfield parameters if you want. Then export from World Machine as "worldmachine\_output.obj".
  1. Open "worldmachine\_output.obj" in MeshLab.
  1. In MeshLab select "Filters" > "Normals, Curvatures and Orientation" > "Transform: Move, Translate, Center". Check the "translate center of bbox to the origin" box and click "Apply" then "Close".
  1. In MeshLab select "Filters" > "Normals, Curvatures and Orientation" > "Transform: Rotate". Set the Rotation angle to 90 degrees around the x-axis and click "Apply" then "Close".
  1. In MeshLab select "Filters" > "Normals, Curvatures and Orientation" > "Transform: Scale". Uncheck the "Uniform Scaling" box. Then set the X Axis value to 81920, the Y Axis value to 240 (which equals 30720/128), and the Z Axis value to 81920. Click "Apply" then "Close". This dialog is a bit buggy so you will have trouble entering the scaling values.
  1. In MeshLab select "File" > "Export Mesh As...". Export the file as "meshlab\_output\_stepped.stl".
  1. Using the command prompt or a batch file convert the STL file to LDR using "stl2dat.exe". An example of the command line looks like this: `stl2dat meshlab_output_stepped.stl -ldr -raw`
  1. Open the LDR file in LDDP.
  1. Change decimal accuracy to 0 by going to "Tools" > "Options" > "Configuration Values" tab > "Editor Behavior" subtab and setting "Position Decimal Accuracy" to zero. Then select all (ctrl A) and round everything (ctrl D).
  1. Save the LDR file in LDDP.
  1. Convert the LDR file to Wavefront OBJ using 3DWin. Export as "3DWin\_output.obj".......3DWin rotates the model again!!!! Stop using 3DWin!!!!......
  1. Open "3DWin\_output.obj" in MeshLab.
  1. <s>In MeshLab rotate the model again around the x-axis by 90 degrees if needed because 3DWin changes the rotation when exporting for some reason.</s> (Note that MeshLab introduces rounding errors during this step. To-do: Need a way to round coordinates to the nearest integer BEFORE they get scaled by t he next step.)
  1. In MeshLab scale the height by 128 along the y-axis.
  1. In MeshLab select "File" > "Export Mesh As...". Export the file as "meshlab\_output\_stepped.stl".
  1. Using the command prompt or a batch file convert the STL file to LDR using "stl2dat.exe". An example of the command line looks like this: `stl2dat meshlab_output_stepped.stl -ldr -raw`
  1. Open the LDR model in MLCAD. The model may be upside-down, so rotate 180 degrees around the x-axis if needed.
  1. All triangle vertices should be integer multiples of 8 at this stage. If you see any decimal values, then you may need one more pass rounding the numbers in LDDP.


## TO CREATE A "STAND-IN" VERSION OF THE MESH ##

  1. Use "terrain\_splitter.js" to split the mesh into 16 pieces. It is located in the "helper\_scripts" folder. There should be some batch files in the same folder or in the parent folder to do this job.
  1. Use "terrain\_colorer.js" on the sixteen pieces to alternately color each triangle. It is located in the "helper\_scripts" folder. There should be some batch files in the same folder or in the parent folder to do this job.
  1. Use "Edger2.exe" to add edge lines around contiguous areas. There should be some batch files in the "helper\_scripts" folder or in the parent folder to do this job.


# TO DO #

  1. Eliminate 3DWin from the process somehow.