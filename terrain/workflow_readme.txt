FOR NON-STEPPED TERRAIN:

1. Open "worldmachine_project.tmd" in World Machine or create a new project.
2. In World Machine select "World Commands" > "Project World Parameters...".
3. In the "Render Extents and Normal Build Resolution" tab make sure that the "Resolution" setting is set to 64x64 and that the "+1" box is checked. Checking the "+1" box will change the resolution to 65x65. This is OK.
4. Also make sure that the "Lower Left Coordinate" setting is set to 0.000000 and 0.000000 and that the "Upper Right Coordinate" setting is set to 1.000000 and 1.000000.
5. In the "General Setup" tab make sure that the "Maximum Elevation" setting is set to 1.000000 and that the "Base Elevation" setting is set to 0.000000.
6. Also make sure that the "Dimensionality" setting is set to "World Machine Units".
7. Continue to tweak the other heightfield parameters if you want. Then export from World Machine as "worldmachine_output.obj".
8. Open "worldmachine_output.obj" in MeshLab.
9. In MeshLab select "Filters" > "Normals, Curvatures and Orientation" > "Transform: Move, Translate, Center". Check the "translate center of bbox to the origin" box and click "Apply" then "Close".
10. In MeshLab select "Filters" > "Normals, Curvatures and Orientation" > "Transform: Rotate". Set the Rotation angle to 270 and click "Apply" then "Close".
11. In MeshLab select "Filters" > "Normals, Curvatures and Orientation" > "Transform: Scale". Uncheck the "Uniform Scaling" box. Then set the X Axis value to 40960, the Y Axis value to 15360, and the Z Axis value to 40960. Click "Apply" then "Close". This dialog is a bit buggy so you will have trouble entering the scaling values.
12. In MeshLab select "File" > "Export Mesh As...". Export the file as "meshlab_output_nosteps.stl".
13. Using the command prompt or a batch file convert the STL file to LDR using "stl2dat.exe". An example of the command line looks like this:
	stl2dat meshlab_output_nosteps.stl -ldr -raw
14. Open the model in MLCAD. The model may be upside-down, so rotate 180 degrees around the x-axis if needed.
15. You're basically done. You can do any post-processing you want in LETGUI, such as adding conditional lines using Edger2 or converting triangles to rectangles using rectifier.


FOR STEPPED TERRAIN:

1. Open "worldmachine_project.tmd" in World Machine or create a new project.
2. In World Machine select "World Commands" > "Project World Parameters...".
3. In the "Render Extents and Normal Build Resolution" tab make sure that the "Resolution" setting is set to 64x64 and that the "+1" box is checked. Checking the "+1" box will change the resolution to 65x65. This is OK.
4. Also make sure that the "Lower Left Coordinate" setting is set to 0.000000 and 0.000000 and that the "Upper Right Coordinate" setting is set to 1.000000 and 1.000000.
5. In the "General Setup" tab make sure that the "Maximum Elevation" setting is set to 1.000000 and that the "Base Elevation" setting is set to 0.000000.
6. Also make sure that the "Dimensionality" setting is set to "World Machine Units".
7. Continue to tweak the other heightfield parameters if you want. Then export from World Machine as "worldmachine_output.obj".
8. Open "worldmachine_output.obj" in MeshLab.
9. In MeshLab select "Filters" > "Normals, Curvatures and Orientation" > "Transform: Move, Translate, Center". Check the "translate center of bbox to the origin" box and click "Apply" then "Close".
10. In MeshLab select "Filters" > "Normals, Curvatures and Orientation" > "Transform: Rotate". Set the Rotation angle to 270 and click "Apply" then "Close".
11. In MeshLab select "Filters" > "Normals, Curvatures and Orientation" > "Transform: Scale". Uncheck the "Uniform Scaling" box. Then set the X Axis value to 40960, the Y Axis value to 640, and the Z Axis value to 40960. Click "Apply" then "Close". This dialog is a bit buggy so you will have trouble entering the scaling values.
12. In MeshLab select "File" > "Export Mesh As...". Export the file as "meshlab_output_stepped.stl".
13. Using the command prompt or a batch file convert the STL file to LDR using "stl2dat.exe". An example of the command line looks like this:
	stl2dat meshlab_output_stepped.stl -ldr -raw
14. Open the LDR file in LDDP.
15. Change decimal accuracy to 0 by going to "Tools" > "Options" > "Configuration Values" tab > "Editor Behavior" subtab and setting "Position Decimal Accuracy" to zero. Then select all (ctrl A) and round everything (ctrl D).
16. Save the LDR file in LDDP.
17. Convert the LDR file to Wavefront OBJ using 3DWin. Export as "3DWin_output.obj".
......3DWin rotates the model again!!!! Stop using 3DWin!!!!......
18. Open "3DWin_output.obj" in MeshLab.
19. In MeshLab rotate the model again if needed because 3DWin changes the rotation when exporting for some reason. Then scale the height by 24 along the y-axis.
20. In MeshLab select "File" > "Export Mesh As...". Export the file as "meshlab_output_stepped.stl".
21. Using the command prompt or a batch file convert the STL file to LDR using "stl2dat.exe". An example of the command line looks like this:
	stl2dat meshlab_output_stepped.stl -ldr -raw
22. Open the LDR model in MLCAD. The model may be upside-down, so rotate 180 degrees around the x-axis if needed.
23. You're basically done. You can do any post-processing you want in LETGUI, such as adding conditional lines using Edger2 or converting triangles to rectangles using rectifier.

TO DO:

1. I still need to figure out how to split the heightfield mesh into 8x8 sections.
2. In my case I had to also raise the terrain by 1024 units in order to get the water level at the right level.
