// Generated by L3P v1.4 BETA 20080930 (Win32)  (C) 1998-2008 Lars C. Hassing SP.lars@AM.hassings.dk
// L3P website:  http://www.hassings.dk/l3/l3p.html
// LDraw.org:    http://www.ldraw.org
// Date:         Sun Jan 01 00:55:01 2012
// Input file:   W:\mecha\povray\road_cross_alt.ldr
// Title:        Untitled
// Author:       Michael Horvath
// ModelDir:     W:\mecha\povray
// WorkDir:      W:\mecha\povray
// LDRAWDIR:     D:\LDraw (LDRAWDIR environment variable)
// SearchDirs:   (Default)
// SearchDir1:   W:\mecha\povray\ (0x10)
// SearchDir2:   D:\LDraw\P\ (0x9)
// SearchDir3:   D:\LDraw\PARTS\ (0x4)
// SearchDir4:   D:\LDraw\MODELS\ (0x0)
// ldconfig.ldr: D:\LDraw\ldconfig.ldr
// Commandline:  "C:\Programs Windows\l3p14beta\l3p.exe" W:\mecha\povray\road_cross_alt.ldr -o -ic -il -ibmecha.inc

#if (version < 3.1)
	#error "This POV code requires at least version 3.1\n"
#end

//// Defines

#declare L3Version = 1.4;

#declare L3Quality = 2;  // Quality level, 0=BBox, 1=no refr, 2=normal, 3=studlogo, 4=stud2logo

#declare L3SW = 0.5;  // Width of seam between two bricks

#declare L3Studs = 1;  // 1=on 0=off

#declare L3Bumps = 0;  // 1=on 0=off


#declare L3Ambient = 0.4;
#declare L3Diffuse = 0.4;
#declare L3Ior     = 1.25;
#declare L3NormalBumps = normal { bumps 0.01 scale 20 }
#declare L3NormalSlope = normal { bumps 0.3 scale 0.5 }


#declare L3SWT = (L3SW ? L3SW : 0.001);  // At least a small seam when transparent

#declare L3Logo = union {
	sphere {<-59,0,-96>,6}
	cylinder {<-59,0,-96>,<59,0,-122>,6 open}
	sphere {<59,0,-122>,6}
	cylinder {<59,0,-122>,<59,0,-84>,6 open}
	sphere {<59,0,-84>,6}

	sphere {<-59,0,-36>,6}
	cylinder {<-59,0,-36>,<-59,0,1>,6 open}
	sphere {<-59,0,1>,6}
	cylinder {<0,0,-49>,<0,0,-25>,6 open}
	sphere {<0,0,-25>,6}
	sphere {<59,0,-62>,6}
	cylinder {<59,0,-62>,<59,0,-24>,6 open}
	sphere {<59,0,-24>,6}
	cylinder {<-59,0,-36>,<59,0,-62>,6 open}

	sphere {<-35.95,0,57>,6}
	torus {18.45,6 clipped_by{plane{<40,0,-9>,0}} translate<-40,0,39>}
	cylinder {<-44.05,0,21>,<35.95,0,3>,6 open}
	torus {18.45,6 clipped_by{plane{<-40,0,9>,0}} translate<40,0,21>}
	cylinder {<44.05,0,39>,<0,0,49>,6 open}
	sphere {<0,0,49>,6}
	cylinder {<0,0,49>,<0,0,34>,6 open}
	sphere {<0,0,34>,6}

	torus {18.45,6 clipped_by{plane{<40,0,-9>,0}} translate<-40,0,99>}
	cylinder {<-44.05,0,81>,<35.95,0,63>,6 open}
	torus {18.45,6 clipped_by{plane{<-40,0,9>,0}} translate<40,0,81>}
	cylinder {<44.05,0,99>,<-35.95,0,117>,6 open}

	scale 4.5/128
}


//// IncludeFile AtBeginning
#include "mecha.inc"



//// Finishes
#ifndef (L3FinishOpaque)
#declare L3FinishOpaque = finish {
	ambient L3Ambient
	diffuse L3Diffuse
	#if (L3Quality >= 2)
		phong 0.5
		phong_size 40
		reflection 0.08
	#end
}
#end

#ifndef (L3FinishChrome)
#declare L3FinishChrome = finish {
	ambient 0.25
	diffuse 0.6
	#if (L3Quality >= 2)
		brilliance 5
		metallic
		specular 0.80
		roughness 1/100
		reflection 0.65
	#end
}
#end

#ifndef (L3FinishPearlescent)
//Not supported yet, using Opaque
#declare L3FinishPearlescent = finish { L3FinishOpaque }
#end

#ifndef (L3FinishRubber)
#declare L3FinishRubber = finish {
	ambient L3Ambient
	diffuse L3Diffuse
	#if (L3Quality >= 2)
		phong 0.1
		phong_size 10
		reflection 0
	#end
}
#end

#ifndef (L3FinishMatte_metallic)
//Not supported yet, using Opaque
#declare L3FinishMatte_metallic = finish { L3FinishOpaque }
#end

#ifndef (L3FinishMetal)
//Not supported yet, using Opaque
#declare L3FinishMetal = finish { L3FinishOpaque }
#end

#ifndef (L3FinishTransparent)
#declare L3FinishTransparent = finish {
	ambient L3Ambient
	diffuse L3Diffuse
	#if (L3Quality >= 2)
		phong 0.5
		phong_size 40
		reflection 0.2
	#end
}
#end



//// Macros
#ifndef (L3TextureOpaqueRGB)
#macro L3TextureOpaqueRGB(r,g,b)
texture {
	pigment { rgb <r/255,g/255,b/255> }
	finish { L3FinishOpaque }
	#if (L3Bumps & (L3Quality > 1)) normal { L3NormalBumps } #end
}
#end
#end

#ifndef (L3TextureChromeRGB)
#macro L3TextureChromeRGB(r,g,b)
texture {
	pigment { rgb <r/255,g/255,b/255> }
	finish { L3FinishChrome }
	#if (L3Bumps & (L3Quality > 1)) normal { L3NormalBumps } #end
}
#end
#end

#ifndef (L3TexturePearlescentRGB)
#macro L3TexturePearlescentRGB(r,g,b)
texture {
	pigment { rgb <r/255,g/255,b/255> }
	finish { L3FinishPearlescent }
	#if (L3Bumps & (L3Quality > 1)) normal { L3NormalBumps } #end
}
#end
#end

#ifndef (L3TextureRubberRGB)
#macro L3TextureRubberRGB(r,g,b)
texture {
	pigment { rgb <r/255,g/255,b/255> }
	finish { L3FinishRubber }
	#if (L3Bumps & (L3Quality > 1)) normal { L3NormalBumps } #end
}
#end
#end

#ifndef (L3TextureMatte_metallicRGB)
#macro L3TextureMatte_metallicRGB(r,g,b)
texture {
	pigment { rgb <r/255,g/255,b/255> }
	finish { L3FinishMatte_metallic }
	#if (L3Bumps & (L3Quality > 1)) normal { L3NormalBumps } #end
}
#end
#end

#ifndef (L3TextureMetalRGB)
#macro L3TextureMetalRGB(r,g,b)
texture {
	pigment { rgb <r/255,g/255,b/255> }
	finish { L3FinishMetal }
	#if (L3Bumps & (L3Quality > 1)) normal { L3NormalBumps } #end
}
#end
#end

#ifndef (L3TextureTransparentRGBA)
#macro L3TextureTransparentRGBA(r,g,b,a)
// Alpha -> Filter: 255 -> 1.00, 128 -> 0.85, 0 -> 0
#local f = (a >= 128 ? 0.85 + (a-128) * 0.15 / (255-128) : a * 0.85 / 255);
texture {
	pigment { rgb <r/255,g/255,b/255> #if (L3Quality > 1) filter f #end }
	finish { L3FinishTransparent }
	#if (L3Bumps & (L3Quality > 1)) normal { L3NormalBumps } #end
}
#end
#end

#ifndef (L3TextureSlope)
#macro L3TextureSlope(tex)
texture {
	tex
	#if (L3Quality > 1) normal { L3NormalSlope } #end
}
#end
#end

#ifndef (L3Material)
#macro L3Material(tex)
material {
	texture { tex }
}
#end
#end

#ifndef (L3MaterialT)
#macro L3MaterialT(tex)
material {
	texture { tex }
	#if (L3Quality > 1)
		interior { ior L3Ior }
	#end
}
#end
#end



//// Color 7 Light_Gray (from ldconfig.ldr)
#ifndef (L3Texture7)
#declare L3Texture7 = L3TextureOpaqueRGB(156,153,153)
#end
#ifndef (L3Texture7_slope)
#declare L3Texture7_slope = L3TextureSlope(L3Texture7)
#end
#ifndef (L3Color7)
#declare L3Color7 = L3Material(L3Texture7)
#end
#ifndef (L3Color7_slope)
#declare L3Color7_slope = L3Material(L3Texture7_slope)
#end


//// Color 2 Green (from ldconfig.ldr)
#ifndef (L3Texture2)
#declare L3Texture2 = L3TextureOpaqueRGB(0,140,20)
#end
#ifndef (L3Texture2_slope)
#declare L3Texture2_slope = L3TextureSlope(L3Texture2)
#end
#ifndef (L3Color2)
#declare L3Color2 = L3Material(L3Texture2)
#end
#ifndef (L3Color2_slope)
#declare L3Color2_slope = L3Material(L3Texture2_slope)
#end


//// Color 15 White (from ldconfig.ldr)
#ifndef (L3Texture15)
#declare L3Texture15 = L3TextureOpaqueRGB(255,255,255)
#end
#ifndef (L3Texture15_slope)
#declare L3Texture15_slope = L3TextureSlope(L3Texture15)
#end
#ifndef (L3Color15)
#declare L3Color15 = L3Material(L3Texture15)
#end
#ifndef (L3Color15_slope)
#declare L3Color15_slope = L3Material(L3Texture15_slope)
#end


//// Primitive rect2p.dat
#ifndef (rect2p_dot_dat)
#declare rect2p_dot_dat = object {
// Rectangle with 2 Parallel Edges
// Name: rect2p.dat
// Author: Donald Sutter [technog]
// !LDRAW_ORG Primitive UPDATE 2010-01
// !LICENSE Redistributable under CCAL version 2.0 : see CAreadme.txt
// BFC CERTIFY CCW
// !HISTORY 2003-08-01 [PTadmin] Official Update 2003-02
// !HISTORY 2007-06-24 [PTadmin] Header formatted for Contributor Agreement
// !HISTORY 2008-07-01 [PTadmin] Official Update 2008-01
// !HISTORY 2010-01-17 [mikeheide] changed winding to CCW
// !HISTORY 2010-04-05 [PTadmin] Official Update 2010-01
	mesh {
		triangle { <-1,0,1>, <-1,0,-1>, <1,0,-1> }
		triangle { <1,0,-1>, <1,0,1>, <-1,0,1> }
	}
}
#end // ifndef (rect2p_dot_dat)


//// Primitive 1-4disc.dat
#ifndef (_1_dash_4disc_dot_dat)
#declare _1_dash_4disc_dot_dat = disc { <0,0,0>, <0,1,0>, 1 clipped_by { plane { -x, 0 } plane { -z, 0 } } }
#end // ifndef (_1_dash_4disc_dot_dat)


//// Primitive 1-4cyli.dat
#ifndef (_1_dash_4cyli_dot_dat)
#declare _1_dash_4cyli_dot_dat = cylinder { <0,0,0>, <0,1,0>, 1 open clipped_by { plane { <-1,0,-1>, -sqrt(1/2) } } }
#end // ifndef (_1_dash_4cyli_dot_dat)


//// Part s\3811s01.dat
#ifndef (s_slash_3811s01_dot_dat)
#declare s_slash_3811s01_dot_dat = #if (L3Quality = 0) box { <-320,0,-320>, <320,4,320> } #else union {
// ~Baseplate 32 x 32 without Top Surface
// Name: s\3811s01.dat
// Author: Mark Kennedy [mkennedy]
// !LDRAW_ORG Subpart UPDATE 2004-02
// !LICENSE Redistributable under CCAL version 2.0 : see CAreadme.txt
// BFC CERTIFY CW
// !HISTORY 2004-04-22 [PTadmin] Official Update 2004-02
// !HISTORY 2007-08-31 [PTadmin] Header formatted for Contributor Agreement
// !HISTORY 2008-07-01 [PTadmin] Official Update 2008-01
	object { rect2p_dot_dat matrix <316,0,0,0,0,-1,0,2,0,0,2,320> }
	object { rect2p_dot_dat matrix <0,0,316,-1,0,0,0,2,0,320,2,0> }
	object { rect2p_dot_dat matrix <316,0,0,0,0,1,0,2,0,0,2,-320> }
	object { rect2p_dot_dat matrix <0,0,316,1,0,0,0,2,0,-320,2,0> }
	object { _1_dash_4disc_dot_dat matrix <4,0,0,0,-1,0,0,0,4,316,4,316> }
	object { _1_dash_4disc_dot_dat matrix <-4,0,0,0,-1,0,0,0,4,-316,4,316> }
	object { _1_dash_4disc_dot_dat matrix <-4,0,0,0,-1,0,0,0,-4,-316,4,-316> }
	object { _1_dash_4disc_dot_dat matrix <4,0,0,0,-1,0,0,0,-4,316,4,-316> }
	mesh {
		triangle { <316,4,316>, <316,4,320>, <-316,4,320> }
		triangle { <-316,4,320>, <-316,4,316>, <316,4,316> }
		triangle { <-316,4,-316>, <-316,4,-320>, <316,4,-320> }
		triangle { <316,4,-320>, <316,4,-316>, <-316,4,-316> }
		triangle { <320,4,316>, <-320,4,316>, <-320,4,-316> }
		triangle { <-320,4,-316>, <320,4,-316>, <320,4,316> }
	}
	object { _1_dash_4cyli_dot_dat matrix <4,0,0,0,4,0,0,0,4,316,0,316> }
	object { _1_dash_4cyli_dot_dat matrix <-4,0,0,0,4,0,0,0,4,-316,0,316> }
	object { _1_dash_4cyli_dot_dat matrix <-4,0,0,0,4,0,0,0,-4,-316,0,-316> }
	object { _1_dash_4cyli_dot_dat matrix <4,0,0,0,4,0,0,0,-4,316,0,-316> }
}
#end
#end // ifndef (s_slash_3811s01_dot_dat)


//// Primitive stud.dat
#ifndef (stud_dot_dat)
#declare stud_dot_dat = 
#if (L3Quality >= 3)
union {
#end
	cylinder { <0,0,0>, <0,-4,0>, 6 }
#if (L3Quality >= 3)
	object { L3Logo translate <0,-4,0> }
}
#end
#end // ifndef (stud_dot_dat)


//// Primitive stug3.dat
#ifndef (stug3_dot_dat)
#declare stug3_dot_dat = union {
// Stud Group  3 x  3
// Name: stug3.dat
// Author: Steve Bliss [sbliss]
// !LDRAW_ORG Primitive UPDATE 2005-01
// !LICENSE Redistributable under CCAL version 2.0 : see CAreadme.txt
// BFC CERTIFY CCW
// !HISTORY 2005-12-28 [PTadmin] Official Update 2005-01
// !HISTORY 2007-05-04 [PTadmin] Header formatted for Contributor Agreement
// !HISTORY 2008-07-01 [PTadmin] Official Update 2008-01
	object { stud_dot_dat matrix <1,0,0,0,1,0,0,0,1,-20,0,-20> }
	object { stud_dot_dat matrix <1,0,0,0,1,0,0,0,1,-20,0,0> }
	object { stud_dot_dat matrix <1,0,0,0,1,0,0,0,1,-20,0,20> }
	object { stud_dot_dat matrix <1,0,0,0,1,0,0,0,1,0,0,-20> }
	object { stud_dot_dat matrix <1,0,0,0,1,0,0,0,1,0,0,0> }
	object { stud_dot_dat matrix <1,0,0,0,1,0,0,0,1,0,0,20> }
	object { stud_dot_dat matrix <1,0,0,0,1,0,0,0,1,20,0,-20> }
	object { stud_dot_dat matrix <1,0,0,0,1,0,0,0,1,20,0,0> }
	object { stud_dot_dat matrix <1,0,0,0,1,0,0,0,1,20,0,20> }
}
#end // ifndef (stug3_dot_dat)


//// Primitive stug6.dat
#ifndef (stug6_dot_dat)
#declare stug6_dot_dat = union {
// Stud Group  6 x  6
// Name: stug6.dat
// Author: Tore Eriksson [simlego]
// !LDRAW_ORG Primitive UPDATE 2005-01
// !LICENSE Redistributable under CCAL version 2.0 : see CAreadme.txt
// BFC CERTIFY CCW
// !HISTORY 2005-12-28 [PTadmin] Official Update 2005-01
// !HISTORY 2007-05-04 [PTadmin] Header formatted for Contributor Agreement
// !HISTORY 2008-07-01 [PTadmin] Official Update 2008-01
	#if (L3Studs)
		object { stug3_dot_dat matrix <1,0,0,0,1,0,0,0,1,-30,0,-30> }
		object { stug3_dot_dat matrix <1,0,0,0,1,0,0,0,1,-30,0,30> }
		object { stug3_dot_dat matrix <1,0,0,0,1,0,0,0,1,30,0,30> }
		object { stug3_dot_dat matrix <1,0,0,0,1,0,0,0,1,30,0,-30> }
	#end
}
#end // ifndef (stug6_dot_dat)


//// Primitive stug7.dat
#ifndef (stug7_dot_dat)
#declare stug7_dot_dat = #if (L3Studs) union #else object #end {
// Stud Group  7 x  7
// Name: stug7.dat
// Author: Michael Heidemann [mikeheide]
// !LDRAW_ORG Primitive UPDATE 2005-01
// !LICENSE Redistributable under CCAL version 2.0 : see CAreadme.txt
// BFC CERTIFY CCW
// !HISTORY 2005-12-28 [PTadmin] Official Update 2005-01
// !HISTORY 2007-05-04 [PTadmin] Header formatted for Contributor Agreement
// !HISTORY 2008-07-01 [PTadmin] Official Update 2008-01
	object { stug6_dot_dat matrix <1,0,0,0,1,0,0,0,1,-10,0,10> }
	#if (L3Studs)
		object { stud_dot_dat matrix <1,0,0,0,1,0,0,0,1,60,0,-40> }
		object { stud_dot_dat matrix <1,0,0,0,1,0,0,0,1,60,0,-20> }
		object { stud_dot_dat matrix <1,0,0,0,1,0,0,0,1,60,0,0> }
		object { stud_dot_dat matrix <1,0,0,0,1,0,0,0,1,60,0,20> }
		object { stud_dot_dat matrix <1,0,0,0,1,0,0,0,1,60,0,40> }
		object { stud_dot_dat matrix <1,0,0,0,1,0,0,0,1,60,0,60> }
		object { stud_dot_dat matrix <1,0,0,0,1,0,0,0,1,-60,0,-60> }
		object { stud_dot_dat matrix <1,0,0,0,1,0,0,0,1,-40,0,-60> }
		object { stud_dot_dat matrix <1,0,0,0,1,0,0,0,1,-20,0,-60> }
		object { stud_dot_dat matrix <1,0,0,0,1,0,0,0,1,0,0,-60> }
		object { stud_dot_dat matrix <1,0,0,0,1,0,0,0,1,20,0,-60> }
		object { stud_dot_dat matrix <1,0,0,0,1,0,0,0,1,40,0,-60> }
		object { stud_dot_dat matrix <1,0,0,0,1,0,0,0,1,60,0,-60> }
	#end
}
#end // ifndef (stug7_dot_dat)


//// Part s\2361s01.dat
#ifndef (s_slash_2361s01_dot_dat)
#declare s_slash_2361s01_dot_dat = #if (L3Quality = 0) box { <-320,-4,-320>, <320,4,320> } #else union {
// ~Baseplate 32 x 32 Road 7-Stud Crossroads without Top Surface
// Name: s\2361s01.dat
// Author: Alex Taylor [anathema]
// !LDRAW_ORG Subpart UPDATE 2010-02
// !LICENSE Redistributable under CCAL version 2.0 : see CAreadme.txt
// BFC CERTIFY CCW
// !HISTORY 2010-04-09 [mikeheide] Moved some portion to main parts
// !HISTORY 2010-07-05 [PTadmin] Official Update 2010-02
	object { s_slash_3811s01_dot_dat matrix <1,0,0,0,1,0,0,0,1,0,0,0> }
	object { stug7_dot_dat matrix <0,0,-1,0,1,0,1,0,0,-250,0,250> }
	object { stug7_dot_dat matrix <0,0,-1,0,1,0,1,0,0,-250,0,-250> }
	object { stug7_dot_dat matrix <0,0,-1,0,1,0,1,0,0,250,0,250> }
	object { stug7_dot_dat matrix <0,0,-1,0,1,0,1,0,0,250,0,-250> }
}
#end
#end // ifndef (s_slash_2361s01_dot_dat)


//// Part s\611p01a.dat
#ifndef (s_slash_611p01a_dot_dat)
#declare s_slash_611p01a_dot_dat = #if (L3Quality = 0) box { <-124,0,-31>, <124,0,31> } #else union {
// ~Baseplate 32 x 32 Road 8-Stud - Crosswalk Pattern
// Name: s\611p01a.dat
// Author: Alex Taylor [anathema]
// !LDRAW_ORG Subpart UPDATE 2010-02
// !LICENSE Redistributable under CCAL version 2.0 : see CAreadme.txt
// BFC CERTIFY CCW
// !HISTORY 2010-07-05 [PTadmin] Official Update 2010-02
	mesh {
		triangle { <7.5,0,-31>, <7.5,0,31>, <-7.5,0,31> }
		triangle { <-7.5,0,31>, <-7.5,0,-31>, <7.5,0,-31> }
		triangle { <-18.5,0,-31>, <-18.5,0,31>, <-33.5,0,31> }
		triangle { <-33.5,0,31>, <-33.5,0,-31>, <-18.5,0,-31> }
		triangle { <-44.5,0,-31>, <-44.5,0,31>, <-59.5,0,31> }
		triangle { <-59.5,0,31>, <-59.5,0,-31>, <-44.5,0,-31> }
		triangle { <-70.5,0,-31>, <-70.5,0,31>, <-85.5,0,31> }
		triangle { <-85.5,0,31>, <-85.5,0,-31>, <-70.5,0,-31> }
		triangle { <-96.5,0,-31>, <-96.5,0,31>, <-111.5,0,31> }
		triangle { <-111.5,0,31>, <-111.5,0,-31>, <-96.5,0,-31> }
		material { L3Color15 }
	}
	mesh {
		triangle { <-85.5,0,-31>, <-85.5,0,31>, <-96.5,0,31> }
		triangle { <-96.5,0,31>, <-96.5,0,-31>, <-85.5,0,-31> }
		triangle { <-59.5,0,-31>, <-59.5,0,31>, <-70.5,0,31> }
		triangle { <-70.5,0,31>, <-70.5,0,-31>, <-59.5,0,-31> }
		triangle { <-33.5,0,-31>, <-33.5,0,31>, <-44.5,0,31> }
		triangle { <-44.5,0,31>, <-44.5,0,-31>, <-33.5,0,-31> }
		triangle { <-7.5,0,-31>, <-7.5,0,31>, <-18.5,0,31> }
		triangle { <-18.5,0,31>, <-18.5,0,-31>, <-7.5,0,-31> }
		triangle { <-111.5,0,-31>, <-111.5,0,31>, <-124,0,31> }
		triangle { <-124,0,31>, <-124,0,-31>, <-111.5,0,-31> }
		triangle { <85.5,0,31>, <85.5,0,-31>, <96.5,0,-31> }
		triangle { <96.5,0,-31>, <96.5,0,31>, <85.5,0,31> }
		triangle { <59.5,0,31>, <59.5,0,-31>, <70.5,0,-31> }
		triangle { <70.5,0,-31>, <70.5,0,31>, <59.5,0,31> }
		triangle { <33.5,0,31>, <33.5,0,-31>, <44.5,0,-31> }
		triangle { <44.5,0,-31>, <44.5,0,31>, <33.5,0,31> }
		triangle { <7.5,0,31>, <7.5,0,-31>, <18.5,0,-31> }
		triangle { <18.5,0,-31>, <18.5,0,31>, <7.5,0,31> }
		triangle { <111.5,0,31>, <111.5,0,-31>, <124,0,-31> }
		triangle { <124,0,-31>, <124,0,31>, <111.5,0,31> }
	}
	mesh {
		triangle { <111.5,0,-31>, <111.5,0,31>, <96.5,0,31> }
		triangle { <96.5,0,31>, <96.5,0,-31>, <111.5,0,-31> }
		triangle { <85.5,0,-31>, <85.5,0,31>, <70.5,0,31> }
		triangle { <70.5,0,31>, <70.5,0,-31>, <85.5,0,-31> }
		triangle { <59.5,0,-31>, <59.5,0,31>, <44.5,0,31> }
		triangle { <44.5,0,31>, <44.5,0,-31>, <59.5,0,-31> }
		triangle { <33.5,0,-31>, <33.5,0,31>, <18.5,0,31> }
		triangle { <18.5,0,31>, <18.5,0,-31>, <33.5,0,-31> }
		material { L3Color15 }
	}
}
#end
#end // ifndef (s_slash_611p01a_dot_dat)


//// Primitive 48\1-4rin10.dat
#ifndef (_48_slash_1_dash_4rin10_dot_dat)
#declare _48_slash_1_dash_4rin10_dot_dat = disc {
	<0,0,0>, <0,1,0>, 11, 10
	clipped_by { plane { -x, 0 } plane { -z, 0 } }
}
#end // ifndef (_48_slash_1_dash_4rin10_dot_dat)


//// Primitive 48\1-4ring9.dat
#ifndef (_48_slash_1_dash_4ring9_dot_dat)
#declare _48_slash_1_dash_4ring9_dot_dat = disc {
	<0,0,0>, <0,1,0>, 10, 9
	clipped_by { plane { -x, 0 } plane { -z, 0 } }
}
#end // ifndef (_48_slash_1_dash_4ring9_dot_dat)


//// Primitive 48\1-4ring1.dat
#ifndef (_48_slash_1_dash_4ring1_dot_dat)
#declare _48_slash_1_dash_4ring1_dot_dat = disc {
	<0,0,0>, <0,1,0>, 2, 1
	clipped_by { plane { -x, 0 } plane { -z, 0 } }
}
#end // ifndef (_48_slash_1_dash_4ring1_dot_dat)


//// Primitive 48\1-4ring2.dat
#ifndef (_48_slash_1_dash_4ring2_dot_dat)
#declare _48_slash_1_dash_4ring2_dot_dat = disc {
	<0,0,0>, <0,1,0>, 3, 2
	clipped_by { plane { -x, 0 } plane { -z, 0 } }
}
#end // ifndef (_48_slash_1_dash_4ring2_dot_dat)


//// Primitive 48\1-4ring4.dat
#ifndef (_48_slash_1_dash_4ring4_dot_dat)
#declare _48_slash_1_dash_4ring4_dot_dat = disc {
	<0,0,0>, <0,1,0>, 5, 4
	clipped_by { plane { -x, 0 } plane { -z, 0 } }
}
#end // ifndef (_48_slash_1_dash_4ring4_dot_dat)


//// Primitive 48\1-4rin25.dat
#ifndef (_48_slash_1_dash_4rin25_dot_dat)
#declare _48_slash_1_dash_4rin25_dot_dat = disc {
	<0,0,0>, <0,1,0>, 26, 25
	clipped_by { plane { -x, 0 } plane { -z, 0 } }
}
#end // ifndef (_48_slash_1_dash_4rin25_dot_dat)


//// Primitive 48\1-4rin26.dat
#ifndef (_48_slash_1_dash_4rin26_dot_dat)
#declare _48_slash_1_dash_4rin26_dot_dat = disc {
	<0,0,0>, <0,1,0>, 27, 26
	clipped_by { plane { -x, 0 } plane { -z, 0 } }
}
#end // ifndef (_48_slash_1_dash_4rin26_dot_dat)


//// Primitive 48\1-4disc.dat
#ifndef (_48_slash_1_dash_4disc_dot_dat)
#declare _48_slash_1_dash_4disc_dot_dat = disc { <0,0,0>, <0,1,0>, 1 clipped_by { plane { -x, 0 } plane { -z, 0 } } }
#end // ifndef (_48_slash_1_dash_4disc_dot_dat)


//// Primitive 48\1-4ndis.dat
#ifndef (_48_slash_1_dash_4ndis_dot_dat)
#declare _48_slash_1_dash_4ndis_dot_dat = disc { <0,0,0>, <0,1,0>, 2, 1 clipped_by { box { <0,-1,0>, <1,1,1> } } }
#end // ifndef (_48_slash_1_dash_4ndis_dot_dat)


//// Part 2361p01.dat
#ifndef (_2361p01_dot_dat)
#declare _2361p01_dot_dat = #if (L3Quality = 0) box { <-320,-4,-320>, <320,4,320> } #else union {
// Baseplate 32 x 32 Road 7-Stud Crossroads with Crosswalk Pattern
// Name: 2361p01.dat
// Author: Steve Bliss [sbliss]
// !LDRAW_ORG Part UPDATE 2010-02
// !LICENSE Redistributable under CCAL version 2.0 : see CAreadme.txt
// BFC CERTIFY CCW
// !KEYWORDS roadplate, X-road
// !HISTORY 1999-03-23 [sbliss] 2361.dat + 607P01.dat pattern + Mods = 2361P01.dat
// !HISTORY 1999-05-24 [PTadmin] Official Update 1999-04
// !HISTORY 2007-07-01 [PTadmin] Header formatted for Contributor Agreement
// !HISTORY 2008-07-01 [PTadmin] Official Update 2008-01
// !HISTORY 2008-07-03 [anathema] Used subfile; BFC'd; removed edge-lines from pattern
// !HISTORY 2010-04-09 [mikeheide] Moved portions from subfile
// !HISTORY 2010-07-05 [PTadmin] Official Update 2010-02
	object { s_slash_2361s01_dot_dat matrix <1,0,0,0,1,0,0,0,1,0,0,0> }
	mesh {
		triangle { <-161,0,-124>, <161,0,-124>, <161,0,124> }
		triangle { <161,0,124>, <-161,0,124>, <-161,0,-124> }
	}
	object { s_slash_611p01a_dot_dat matrix <-1,0,0,0,1,0,0,0,-1,0,0,-192> }
	object { s_slash_611p01a_dot_dat matrix <0,0,1,0,1,0,-1,0,0,-192,0,0> }
	mesh {
		triangle { <-320,0,124>, <-320,0,5>, <-223,0,5> }
		triangle { <-223,0,5>, <-223,0,124>, <-320,0,124> }
		triangle { <-320,0,-5>, <-320,0,-124>, <-223,0,-124> }
		triangle { <-223,0,-124>, <-223,0,-5>, <-320,0,-5> }
		triangle { <-124,0,-320>, <-5,0,-320>, <-5,0,-223> }
		triangle { <-5,0,-223>, <-124,0,-223>, <-124,0,-320> }
		triangle { <-124,0,-161>, <124,0,-161>, <124,0,-124> }
		triangle { <124,0,-124>, <-124,0,-124>, <-124,0,-161> }
		triangle { <5,0,-320>, <124,0,-320>, <124,0,-223> }
		triangle { <124,0,-223>, <5,0,-223>, <5,0,-320> }
	}
	mesh {
		triangle { <124,0,-190>, <124,0,-320>, <136,0,-320> }
		triangle { <136,0,-320>, <136,0,-190>, <124,0,-190> }
		material { L3Color2 }
	}
	mesh {
		triangle { <170,0,-190>, <136,0,-190>, <136,0,-320> }
		triangle { <136,0,-320>, <170,0,-320>, <170,0,-190> }
	}
	mesh {
		triangle { <320,0,-124>, <190,0,-124>, <190,0,-136> }
		triangle { <190,0,-136>, <320,0,-136>, <320,0,-124> }
		material { L3Color2 }
	}
	mesh {
		triangle { <320,0,-170>, <320,0,-136>, <190,0,-136> }
		triangle { <190,0,-136>, <190,0,-170>, <320,0,-170> }
	}
	object { _48_slash_1_dash_4rin10_dot_dat matrix <-6,0,0,0,1,0,0,0,6,190,0,-190> material { L3Color2 } }
	object { _48_slash_1_dash_4ring9_dot_dat matrix <-6,0,0,0,1,0,0,0,6,190,0,-190> material { L3Color2 } }
	object { _48_slash_1_dash_4ring1_dot_dat matrix <-20,0,0,0,1,0,0,0,20,190,0,-190> }
	object { _48_slash_1_dash_4ring2_dot_dat matrix <-6,0,0,0,1,0,0,0,6,190,0,-190> material { L3Color15 } }
	object { _48_slash_1_dash_4ring9_dot_dat matrix <-2,0,0,0,1,0,0,0,2,190,0,-190> material { L3Color15 } }
	mesh {
		triangle { <178,0,-320>, <178,0,-190>, <170,0,-190> }
		triangle { <170,0,-190>, <170,0,-320>, <178,0,-320> }
		triangle { <320,0,-178>, <320,0,-170>, <190,0,-170> }
		triangle { <190,0,-170>, <190,0,-178>, <320,0,-178> }
		material { L3Color15 }
	}
	mesh {
		triangle { <316,0,-320>, <316,0,-316>, <178,0,-316> }
		triangle { <178,0,-316>, <178,0,-320>, <316,0,-320> }
		triangle { <320,0,-316>, <320,0,-190>, <178,0,-190> }
		triangle { <178,0,-190>, <178,0,-316>, <320,0,-316> }
		triangle { <320,0,-190>, <320,0,-178>, <190,0,-178> }
		triangle { <190,0,-178>, <190,0,-190>, <320,0,-190> }
	}
	object { _48_slash_1_dash_4ring4_dot_dat matrix <-10,0,0,0,1,0,0,0,10,190,0,-190> }
	object { _48_slash_1_dash_4rin25_dot_dat matrix <-2,0,0,0,1,0,0,0,2,190,0,-190> }
	object { _48_slash_1_dash_4rin26_dot_dat matrix <-2,0,0,0,1,0,0,0,2,190,0,-190> }
	object { _48_slash_1_dash_4disc_dot_dat matrix <-12,0,0,0,1,0,0,0,12,190,0,-190> }
	object { _48_slash_1_dash_4ndis_dot_dat matrix <-66,0,0,0,1,0,0,0,66,190,0,-190> }
	mesh {
		triangle { <-190,0,-124>, <-320,0,-124>, <-320,0,-136> }
		triangle { <-320,0,-136>, <-190,0,-136>, <-190,0,-124> }
		material { L3Color2 }
	}
	mesh {
		triangle { <-190,0,-170>, <-190,0,-136>, <-320,0,-136> }
		triangle { <-320,0,-136>, <-320,0,-170>, <-190,0,-170> }
	}
	mesh {
		triangle { <-124,0,-320>, <-124,0,-190>, <-136,0,-190> }
		triangle { <-136,0,-190>, <-136,0,-320>, <-124,0,-320> }
		material { L3Color2 }
	}
	mesh {
		triangle { <-170,0,-320>, <-136,0,-320>, <-136,0,-190> }
		triangle { <-136,0,-190>, <-170,0,-190>, <-170,0,-320> }
	}
	object { _48_slash_1_dash_4rin10_dot_dat matrix <0,0,6,0,1,0,6,0,0,-190,0,-190> material { L3Color2 } }
	object { _48_slash_1_dash_4ring9_dot_dat matrix <0,0,6,0,1,0,6,0,0,-190,0,-190> material { L3Color2 } }
	object { _48_slash_1_dash_4ring1_dot_dat matrix <0,0,20,0,1,0,20,0,0,-190,0,-190> }
	object { _48_slash_1_dash_4ring2_dot_dat matrix <0,0,6,0,1,0,6,0,0,-190,0,-190> material { L3Color15 } }
	object { _48_slash_1_dash_4ring9_dot_dat matrix <0,0,2,0,1,0,2,0,0,-190,0,-190> material { L3Color15 } }
	mesh {
		triangle { <-320,0,-178>, <-190,0,-178>, <-190,0,-170> }
		triangle { <-190,0,-170>, <-320,0,-170>, <-320,0,-178> }
		triangle { <-178,0,-320>, <-170,0,-320>, <-170,0,-190> }
		triangle { <-170,0,-190>, <-178,0,-190>, <-178,0,-320> }
		material { L3Color15 }
	}
	mesh {
		triangle { <-320,0,-316>, <-316,0,-316>, <-316,0,-178> }
		triangle { <-316,0,-178>, <-320,0,-178>, <-320,0,-316> }
		triangle { <-316,0,-320>, <-190,0,-320>, <-190,0,-178> }
		triangle { <-190,0,-178>, <-316,0,-178>, <-316,0,-320> }
		triangle { <-190,0,-320>, <-178,0,-320>, <-178,0,-190> }
		triangle { <-178,0,-190>, <-190,0,-190>, <-190,0,-320> }
	}
	object { _48_slash_1_dash_4ring4_dot_dat matrix <0,0,10,0,1,0,10,0,0,-190,0,-190> }
	object { _48_slash_1_dash_4rin25_dot_dat matrix <0,0,2,0,1,0,2,0,0,-190,0,-190> }
	object { _48_slash_1_dash_4rin26_dot_dat matrix <0,0,2,0,1,0,2,0,0,-190,0,-190> }
	object { _48_slash_1_dash_4disc_dot_dat matrix <0,0,12,0,1,0,12,0,0,-190,0,-190> }
	object { _48_slash_1_dash_4ndis_dot_dat matrix <0,0,66,0,1,0,66,0,0,-190,0,-190> }
	mesh {
		triangle { <-276,0,5>, <-300,0,5>, <-300,0,-5> }
		triangle { <-300,0,-5>, <-276,0,-5>, <-276,0,5> }
		triangle { <-223,0,5>, <-236,0,5>, <-236,0,-5> }
		triangle { <-236,0,-5>, <-223,0,-5>, <-223,0,5> }
	}
	mesh {
		triangle { <-300,0,5>, <-320,0,5>, <-320,0,-5> }
		triangle { <-320,0,-5>, <-300,0,-5>, <-300,0,5> }
		triangle { <-236,0,5>, <-276,0,5>, <-276,0,-5> }
		triangle { <-276,0,-5>, <-236,0,-5>, <-236,0,5> }
		material { L3Color15 }
	}
	mesh {
		triangle { <-5,0,-276>, <-5,0,-300>, <5,0,-300> }
		triangle { <5,0,-300>, <5,0,-276>, <-5,0,-276> }
		triangle { <-5,0,-223>, <-5,0,-236>, <5,0,-236> }
		triangle { <5,0,-236>, <5,0,-223>, <-5,0,-223> }
	}
	mesh {
		triangle { <-5,0,-300>, <-5,0,-320>, <5,0,-320> }
		triangle { <5,0,-320>, <5,0,-300>, <-5,0,-300> }
		triangle { <-5,0,-236>, <-5,0,-276>, <5,0,-276> }
		triangle { <5,0,-276>, <5,0,-236>, <-5,0,-236> }
		material { L3Color15 }
	}
	object { s_slash_611p01a_dot_dat matrix <1,0,0,0,1,0,0,0,1,0,0,192> }
	object { s_slash_611p01a_dot_dat matrix <0,0,-1,0,1,0,1,0,0,192,0,0> }
	mesh {
		triangle { <320,0,-124>, <320,0,-5>, <223,0,-5> }
		triangle { <223,0,-5>, <223,0,-124>, <320,0,-124> }
		triangle { <320,0,5>, <320,0,124>, <223,0,124> }
		triangle { <223,0,124>, <223,0,5>, <320,0,5> }
		triangle { <124,0,320>, <5,0,320>, <5,0,223> }
		triangle { <5,0,223>, <124,0,223>, <124,0,320> }
		triangle { <124,0,161>, <-124,0,161>, <-124,0,124> }
		triangle { <-124,0,124>, <124,0,124>, <124,0,161> }
		triangle { <-5,0,320>, <-124,0,320>, <-124,0,223> }
		triangle { <-124,0,223>, <-5,0,223>, <-5,0,320> }
	}
	mesh {
		triangle { <-124,0,190>, <-124,0,320>, <-136,0,320> }
		triangle { <-136,0,320>, <-136,0,190>, <-124,0,190> }
		material { L3Color2 }
	}
	mesh {
		triangle { <-170,0,190>, <-136,0,190>, <-136,0,320> }
		triangle { <-136,0,320>, <-170,0,320>, <-170,0,190> }
	}
	mesh {
		triangle { <-320,0,124>, <-190,0,124>, <-190,0,136> }
		triangle { <-190,0,136>, <-320,0,136>, <-320,0,124> }
		material { L3Color2 }
	}
	mesh {
		triangle { <-320,0,170>, <-320,0,136>, <-190,0,136> }
		triangle { <-190,0,136>, <-190,0,170>, <-320,0,170> }
	}
	object { _48_slash_1_dash_4rin10_dot_dat matrix <6,0,0,0,1,0,0,0,-6,-190,0,190> material { L3Color2 } }
	object { _48_slash_1_dash_4ring9_dot_dat matrix <6,0,0,0,1,0,0,0,-6,-190,0,190> material { L3Color2 } }
	object { _48_slash_1_dash_4ring1_dot_dat matrix <20,0,0,0,1,0,0,0,-20,-190,0,190> }
	object { _48_slash_1_dash_4ring2_dot_dat matrix <6,0,0,0,1,0,0,0,-6,-190,0,190> material { L3Color15 } }
	object { _48_slash_1_dash_4ring9_dot_dat matrix <2,0,0,0,1,0,0,0,-2,-190,0,190> material { L3Color15 } }
	mesh {
		triangle { <-178,0,320>, <-178,0,190>, <-170,0,190> }
		triangle { <-170,0,190>, <-170,0,320>, <-178,0,320> }
		triangle { <-320,0,178>, <-320,0,170>, <-190,0,170> }
		triangle { <-190,0,170>, <-190,0,178>, <-320,0,178> }
		material { L3Color15 }
	}
	mesh {
		triangle { <-316,0,320>, <-316,0,316>, <-178,0,316> }
		triangle { <-178,0,316>, <-178,0,320>, <-316,0,320> }
		triangle { <-320,0,316>, <-320,0,190>, <-178,0,190> }
		triangle { <-178,0,190>, <-178,0,316>, <-320,0,316> }
		triangle { <-320,0,190>, <-320,0,178>, <-190,0,178> }
		triangle { <-190,0,178>, <-190,0,190>, <-320,0,190> }
	}
	object { _48_slash_1_dash_4ring4_dot_dat matrix <10,0,0,0,1,0,0,0,-10,-190,0,190> }
	object { _48_slash_1_dash_4rin25_dot_dat matrix <2,0,0,0,1,0,0,0,-2,-190,0,190> }
	object { _48_slash_1_dash_4rin26_dot_dat matrix <2,0,0,0,1,0,0,0,-2,-190,0,190> }
	object { _48_slash_1_dash_4disc_dot_dat matrix <12,0,0,0,1,0,0,0,-12,-190,0,190> }
	object { _48_slash_1_dash_4ndis_dot_dat matrix <66,0,0,0,1,0,0,0,-66,-190,0,190> }
	mesh {
		triangle { <190,0,124>, <320,0,124>, <320,0,136> }
		triangle { <320,0,136>, <190,0,136>, <190,0,124> }
		material { L3Color2 }
	}
	mesh {
		triangle { <190,0,170>, <190,0,136>, <320,0,136> }
		triangle { <320,0,136>, <320,0,170>, <190,0,170> }
	}
	mesh {
		triangle { <124,0,320>, <124,0,190>, <136,0,190> }
		triangle { <136,0,190>, <136,0,320>, <124,0,320> }
		material { L3Color2 }
	}
	mesh {
		triangle { <170,0,320>, <136,0,320>, <136,0,190> }
		triangle { <136,0,190>, <170,0,190>, <170,0,320> }
	}
	object { _48_slash_1_dash_4rin10_dot_dat matrix <0,0,-6,0,1,0,-6,0,0,190,0,190> material { L3Color2 } }
	object { _48_slash_1_dash_4ring9_dot_dat matrix <0,0,-6,0,1,0,-6,0,0,190,0,190> material { L3Color2 } }
	object { _48_slash_1_dash_4ring1_dot_dat matrix <0,0,-20,0,1,0,-20,0,0,190,0,190> }
	object { _48_slash_1_dash_4ring2_dot_dat matrix <0,0,-6,0,1,0,-6,0,0,190,0,190> material { L3Color15 } }
	object { _48_slash_1_dash_4ring9_dot_dat matrix <0,0,-2,0,1,0,-2,0,0,190,0,190> material { L3Color15 } }
	mesh {
		triangle { <320,0,178>, <190,0,178>, <190,0,170> }
		triangle { <190,0,170>, <320,0,170>, <320,0,178> }
		triangle { <178,0,320>, <170,0,320>, <170,0,190> }
		triangle { <170,0,190>, <178,0,190>, <178,0,320> }
		material { L3Color15 }
	}
	mesh {
		triangle { <320,0,316>, <316,0,316>, <316,0,178> }
		triangle { <316,0,178>, <320,0,178>, <320,0,316> }
		triangle { <316,0,320>, <190,0,320>, <190,0,178> }
		triangle { <190,0,178>, <316,0,178>, <316,0,320> }
		triangle { <190,0,320>, <178,0,320>, <178,0,190> }
		triangle { <178,0,190>, <190,0,190>, <190,0,320> }
	}
	object { _48_slash_1_dash_4ring4_dot_dat matrix <0,0,-10,0,1,0,-10,0,0,190,0,190> }
	object { _48_slash_1_dash_4rin25_dot_dat matrix <0,0,-2,0,1,0,-2,0,0,190,0,190> }
	object { _48_slash_1_dash_4rin26_dot_dat matrix <0,0,-2,0,1,0,-2,0,0,190,0,190> }
	object { _48_slash_1_dash_4disc_dot_dat matrix <0,0,-12,0,1,0,-12,0,0,190,0,190> }
	object { _48_slash_1_dash_4ndis_dot_dat matrix <0,0,-66,0,1,0,-66,0,0,190,0,190> }
	mesh {
		triangle { <276,0,-5>, <300,0,-5>, <300,0,5> }
		triangle { <300,0,5>, <276,0,5>, <276,0,-5> }
		triangle { <223,0,-5>, <236,0,-5>, <236,0,5> }
		triangle { <236,0,5>, <223,0,5>, <223,0,-5> }
	}
	mesh {
		triangle { <300,0,-5>, <320,0,-5>, <320,0,5> }
		triangle { <320,0,5>, <300,0,5>, <300,0,-5> }
		triangle { <236,0,-5>, <276,0,-5>, <276,0,5> }
		triangle { <276,0,5>, <236,0,5>, <236,0,-5> }
		material { L3Color15 }
	}
	mesh {
		triangle { <5,0,276>, <5,0,300>, <-5,0,300> }
		triangle { <-5,0,300>, <-5,0,276>, <5,0,276> }
		triangle { <5,0,223>, <5,0,236>, <-5,0,236> }
		triangle { <-5,0,236>, <-5,0,223>, <5,0,223> }
	}
	mesh {
		triangle { <5,0,300>, <5,0,320>, <-5,0,320> }
		triangle { <-5,0,320>, <-5,0,300>, <5,0,300> }
		triangle { <5,0,236>, <5,0,276>, <-5,0,276> }
		triangle { <-5,0,276>, <-5,0,236>, <5,0,236> }
		material { L3Color15 }
	}
	object { _1_dash_4disc_dot_dat matrix <4,0,0,0,1,0,0,0,4,316,0,316> }
	object { _1_dash_4disc_dot_dat matrix <0,0,-4,0,1,0,4,0,0,316,0,-316> }
	object { _1_dash_4disc_dot_dat matrix <-4,0,0,0,1,0,0,0,-4,-316,0,-316> }
	object { _1_dash_4disc_dot_dat matrix <0,0,4,0,1,0,-4,0,0,-316,0,316> }
}
#end
#end // ifndef (_2361p01_dot_dat)


//// Model road_cross_alt.ldr
#ifndef (road__cross__alt_dot_ldr)
#declare road__cross__alt_dot_ldr = object {
// Untitled
// Name: road_cross_alt.ldr
// Author: Michael Horvath
// Unofficial Model
// ROTATION CENTER 0 0 0 1 "Custom"
// ROTATION CONFIG 0 0
	// 1 16  0 0 0  1 0 0  0 1 0  0 0 1 2361p01.dat
	object {
		_2361p01_dot_dat
		matrix <1-L3SW/640,0,0,0,1-L3SW/8,0,0,0,1-L3SW/640,0,0,0>
		matrix <1,0,0,0,1,0,0,0,1,0,0,0>
	}
}
#end // ifndef (road__cross__alt_dot_ldr)


//// ModelData
#declare L3ModelBBoxMin = <-320,-4,-320>;
#declare L3ModelBBoxMax = <320,4,320>;
#declare L3ModelBBoxCenter = (L3ModelBBoxMin+L3ModelBBoxMax)/2; // <0,0,0>
#declare L3ModelBBoxSize = L3ModelBBoxMax-L3ModelBBoxMin; // <640,8,640>
#declare L3FloorY = L3ModelBBoxMax.y;

//// ModelObject road_cross_alt.ldr
object { road__cross__alt_dot_ldr material { L3Color7 } rotate	y * 360 * clock }



//// Statistics
//               PARTS             P         Total
// DAT files:        4            17            22
// POV Equivs:       -            12 (71%)
// Model has 1 parts (196 studs)

//// End
