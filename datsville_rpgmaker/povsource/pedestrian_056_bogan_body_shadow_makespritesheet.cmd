:: This script assumes the input images are 384x384 pixels
"C:\Program Files\ImageMagick-6.7.6-Q16\Convert.exe" "pedestrian_056_bogan_body_shadow00.png" -crop 288x288+48+96  "pedestrian_056_bogan_body_shadow00.png"
"C:\Program Files\ImageMagick-6.7.6-Q16\Convert.exe" "pedestrian_056_bogan_body_shadow01.png" -crop 288x288+48+96  "pedestrian_056_bogan_body_shadow01.png"
"C:\Program Files\ImageMagick-6.7.6-Q16\Convert.exe" "pedestrian_056_bogan_body_shadow02.png" -crop 288x288+48+96  "pedestrian_056_bogan_body_shadow02.png"
"C:\Program Files\ImageMagick-6.7.6-Q16\Convert.exe" "pedestrian_056_bogan_body_shadow03.png" -crop 288x288+48+96  "pedestrian_056_bogan_body_shadow03.png"
"C:\Program Files\ImageMagick-6.7.6-Q16\Convert.exe" "pedestrian_056_bogan_body_shadow04.png" -crop 288x288+48+96  "pedestrian_056_bogan_body_shadow04.png"
"C:\Program Files\ImageMagick-6.7.6-Q16\Convert.exe" "pedestrian_056_bogan_body_shadow05.png" -crop 288x288+48+96  "pedestrian_056_bogan_body_shadow05.png"
"C:\Program Files\ImageMagick-6.7.6-Q16\Convert.exe" "pedestrian_056_bogan_body_shadow06.png" -crop 288x288+48+96  "pedestrian_056_bogan_body_shadow06.png"
"C:\Program Files\ImageMagick-6.7.6-Q16\Convert.exe" "pedestrian_056_bogan_body_shadow07.png" -crop 288x288+48+96  "pedestrian_056_bogan_body_shadow07.png"
"C:\Program Files\ImageMagick-6.7.6-Q16\Convert.exe" "pedestrian_056_bogan_body_shadow08.png" -crop 288x288+48+96  "pedestrian_056_bogan_body_shadow08.png"
"C:\Program Files\ImageMagick-6.7.6-Q16\Convert.exe" "pedestrian_056_bogan_body_shadow09.png" -crop 288x288+48+96  "pedestrian_056_bogan_body_shadow09.png"
"C:\Program Files\ImageMagick-6.7.6-Q16\Convert.exe" "pedestrian_056_bogan_body_shadow10.png" -crop 288x288+48+96  "pedestrian_056_bogan_body_shadow10.png"
"C:\Program Files\ImageMagick-6.7.6-Q16\Convert.exe" "pedestrian_056_bogan_body_shadow11.png" -crop 288x288+48+96  "pedestrian_056_bogan_body_shadow11.png"
"C:\Program Files\ImageMagick-6.7.6-Q16\Convert.exe" "pedestrian_056_bogan_body_shadow12.png" -crop 288x288+48+96  "pedestrian_056_bogan_body_shadow12.png"
"C:\Program Files\ImageMagick-6.7.6-Q16\Convert.exe" "pedestrian_056_bogan_body_shadow13.png" -crop 288x288+48+96  "pedestrian_056_bogan_body_shadow13.png"
"C:\Program Files\ImageMagick-6.7.6-Q16\Convert.exe" "pedestrian_056_bogan_body_shadow14.png" -crop 288x288+48+96  "pedestrian_056_bogan_body_shadow14.png"
"C:\Program Files\ImageMagick-6.7.6-Q16\Convert.exe" "pedestrian_056_bogan_body_shadow15.png" -crop 288x288+48+96  "pedestrian_056_bogan_body_shadow15.png"
montage "pedestrian_056_bogan_body_shadow03.png" "pedestrian_056_bogan_body_shadow02.png" "pedestrian_056_bogan_body_shadow01.png" "pedestrian_056_bogan_body_shadow07.png" "pedestrian_056_bogan_body_shadow06.png" "pedestrian_056_bogan_body_shadow05.png" "pedestrian_056_bogan_body_shadow15.png" "pedestrian_056_bogan_body_shadow14.png" "pedestrian_056_bogan_body_shadow13.png" "pedestrian_056_bogan_body_shadow11.png" "pedestrian_056_bogan_body_shadow10.png" "pedestrian_056_bogan_body_shadow09.png" -background transparent -tile 3x4 -geometry 288x288! "pedestrian_056_bogan_body_shadow_complete.png"
"C:\Program Files\ImageMagick-6.7.6-Q16\Convert.exe" "pedestrian_056_bogan_body_shadow_complete.png" -resize 216x288 "pedestrian_056_bogan_body_shadow_complete.png"
pause
