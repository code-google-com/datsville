/* * * * * * * * * * * * * * * * * * * * * * * * * * * *
 * Grassy plane with hills in background and blue sky  *
 * Author: Bram Lambrecht                              *
 *                                                     *
 * Note: requires "hills.ghf" and "river.ghf"          *
 *                                                     *
 * * * * * * * * * * * * * * * * * * * * * * * * * * * */

#include "colors.inc"    // The include files contain
#include "shapes.inc"    // pre-defined scene elements
#include "textures.inc"  //  This file has the blue_sky3 texture
#include "stones1.inc"
#declare Color355 =  material { texture { T_Stone17 } } // Won't work on L3P 1.4

// Texture used by plane and hills:
#declare grass = 
   texture { 
      pigment { 
         color rgb <.15,.5,.1> 
      } finish {
         crand 0.2 ambient 0.3 diffuse 0.3
      }
   }                       
// Texture for water in river:
#declare water = 
   texture { 
      pigment { 
         color rgb <0,.2,.4> 
      } finish {
         ambient 0.3 diffuse 0.3 reflection 0.5
      } normal {
         bumps 1 scale 5
      }
  }  

// Fog adds realistic haziness in background, especially in sky:  
//fog { color rgb <1,1,1> distance 50000 }                        

//River and plane:
#declare big=1000000;  // big number
#declare river=6000;   // horizontal displacement of river
#declare r_l=15000;    // length of river
#declare r_w=2800;     // width of river heightfield
#declare r_b=80;       // height of river bank
#declare r_d=240;       // depth of river
object {
   union {               
      object { plane { y, r_d+8 hollow } texture { grass } } 
      polygon { 4, <-r_l/2,r_b,-r_w/2+river>, <r_l/2,r_b,-r_w/2+river>, <r_l/2,r_b,r_w/2+river>, <-r_l/2,r_b,r_w/2+river> texture { water } }
      polygon { 4, <-r_l/2,0,-r_w/2+river>, <r_l/2,0,-r_w/2+river>, <r_l/2,0,-big>, <-r_l/2,0,-big> texture { grass } }
      polygon { 4, <-r_l/2,0,r_w/2+river>, <r_l/2,0,r_w/2+river>, <r_l/2,0,big>, <-r_l/2,0,big> texture { grass } }                          
      polygon { 4, <-r_l/2,0,big>, <-r_l/2,0,-big>, <-big,0,-big>, <-big,0,big> texture { grass } }
      polygon { 4, <r_l/2,0,big>, <r_l/2,0,-big>, <big,0,-big>, <big,0,big> texture { grass } }
      height_field {
          gif
          "river.ghf"
          smooth                    
          scale < r_l, -r_d, r_w >
          translate < -r_l/2, r_d, -r_w/2+river >
          texture { grass }                   
      }                                  
   }                           
   rotate <0,0,0> translate <-2560,4,0>     // change these values to rotate river
   // rotate <0,0,0> translate <-2560,0,0>     // Instead of changing values to Town.pov /Tore 2010
}                                        
// The hills (centered at 0,0,0 with room for approximately 500x500 studs):
height_field {
    gif
    "hills.ghf"
    smooth                    
    water_level r_d/700
    scale < 40000, -700, 40000 >
    translate < -20000, r_d, -20000 >
    texture { grass }                   
}                      
               
// The sky:     
difference {
     sphere { <0,0,0>,1}
     sphere { <0,0,0>,.98 texture { Blue_Sky3 finish {reflection 0.0 diffuse 0.0 ambient 1.0} } }
     scale <30000,10000,30000>
     no_shadow
}  
//  Changes to Town.pov  No need to(?) I changed river values instead, seems to work. /Tore 2010
//    matrix <1,0,0,0,1,0,0,0,1,0,-4,0> 
// Delete color 355 definition
                  
// If you change the color of the sky, I suggest
// you change the color of the fog also.
  
// Feel free to change the camera and lights to any possition:
// camera { location <-1500,-500,-100>  sky -y  right -4/3*x  look_at <0,-400,0> }
// light_source { <-15000, -90000, -8000> color rgb <1,1,1> } 
// light_source { <6000,-34010.41,-24010.41> color rgb <1,1,1> shadowless }                 
// light_source { <25470.08,-26980.06,14700.56> color rgb <1,1,1> shadowless }
// light_source { <-14700.56,-39410.12,8490.028> color rgb <1,1,1> shadowless }
                                       
// EOF