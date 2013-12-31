////////////////////////////////////////////////////////////////////////////////

#include "CIE.inc"			// http://www.ignorancia.org/en/index.php?page=Lightsys
#include "lightsys.inc"			// http://www.ignorancia.org/en/index.php?page=Lightsys
#include "lightsys_constants.inc"	// http://www.ignorancia.org/en/index.php?page=Lightsys

#declare light_lumens		= 3;					// float
#declare light_temp		= Daylight(6100);			// float
#declare light_color		= Light_Color(light_temp,light_lumens);
#declare LDXSkipLight1		= true;
#declare LDXSkipLight2		= true;
#declare LDXSkipLight3		= true;

// Lights:
#declare light_source_location	= vrotate(<0,0,-320000>, <-60,-120 + 90,+00>);

light_source
{
	light_source_location
	light_color
	parallel
}

// Floor
object
{
	plane { y, 4 hollow }
	texture
	{
		pigment
		{
			checker
			pigment {color rgb <067,084,029>/255}
			pigment {color rgb <040,066,018>/255}
		}
		scale 640
	}
}

// Sky
sky_sphere
{
	pigment
	{
		gradient -y
		color_map
		{
			[0.0 color rgb <0.6,0.7,1.0>]
			[0.7 color rgb <0.0,0.1,0.8>]
		}
	}
}

global_settings
{
	assumed_gamma	2.2
	adc_bailout	0.005
	max_trace_level	16	//50
	ambient_light	1
	radiosity
	{
		pretrace_start	0.08
		pretrace_end	0.02 // Try 0.01 if you see random black spots.
		count		20
		error_bound	1
		recursion_limit	1
		normal		on
		brightness	1.4
		always_sample	no
		gray_threshold	0.8
		media		on
	}
}

////////////////////////////////////////////////////////////////////////////////
