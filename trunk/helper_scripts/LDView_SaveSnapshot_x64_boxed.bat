set LDVIEW_EXE="C:\Program Files\LDView\LDView64.exe"
cd "W:\LDraw\svn\trunk\datsville_boxed"
for %%a in ( "*.dat", "*.ldr", "*.mpd" ) do %LDVIEW_EXE% "%%a" -SaveSnapshot=%%~na.png -PreferenceSet=DatsvilleSVN -SaveActualSize=0 -SaveImageType=1 -SaveZoomToFit=1 -SaveWidth=400 -SaveHeight=300 -DefaultZoom=0.95 -FOV=10 -DefaultLatLong=30,45
pause
