var point_1_x = 0
var point_1_y = 0
var point_2_x = 400
var point_2_y = 0
var point_3_x = 640
var point_3_y = 128
var point_4_x = 1040
var point_4_y = 128

var minimum_distance = 0.1
var target_distance = 40
var steps_distance_big = 1/target_distance

var C_x = 2 * point_3_x - point_4_x
var C_y = 2 * point_3_y - point_4_y

var sOutString = ''

var fso = new ActiveXObject('Scripting.FileSystemObject')
var WshShell = new ActiveXObject('WScript.Shell')

function tCoordinates(t)
{
	return	[
		(point_3_x + 3 * point_2_x - 3 * C_x - point_1_x) * Math.pow(t, 3) + (3 * C_x - 6 * point_2_x + 3 * point_1_x) * Math.pow(t, 2) + (3 * point_2_x - 3 * point_1_x) * t + point_1_x,
		(point_3_y + 3 * point_2_y - 3 * C_y - point_1_y) * Math.pow(t, 3) + (3 * C_y - 6 * point_2_y + 3 * point_1_y) * Math.pow(t, 2) + (3 * point_2_y - 3 * point_1_y) * t + point_1_y
	]
}

function tDerivatives(t)
{
	return	[
		(point_3_x + 3 * point_2_x - 3 * C_x - point_1_x) * 3 * Math.pow(t, 2) + (3 * C_x - 6 * point_2_x + 3 * point_1_x) * 2 * t + (3 * point_2_x - 3 * point_1_x),
		(point_3_y + 3 * point_2_y - 3 * C_y - point_1_y) * 3 * Math.pow(t, 2) + (3 * C_y - 6 * point_2_y + 3 * point_1_y) * 2 * t + (3 * point_2_y - 3 * point_1_y)
	]
}

function vdistance(tVec_1, tVec_2)
{
	return Math.sqrt(Math.pow(tVec_2[0] - tVec_1[0], 2) + Math.pow(tVec_2[1] - tVec_1[1], 2))
}

function vnormalize(tVec)
{
	return	[
		tVec[0] / vdistance([0,0], tVec),
		tVec[1] / vdistance([0,0], tVec)
	]
}

function vmultiply(tVec, fVal)
{
	var tmpVec = []
	for (var i = 0; i < 2; i++)
	{
		tmpVec[i] = tVec[i] * fVal
	}
	return tmpVec
}

function bGetStuff(fTime_1, fTime_2, fStepDist, iSign)
{
	var tCoo_1 = tCoordinates(fTime_1)
	var tCoo_2 = tCoordinates(fTime_2)
	var fDist = vdistance(tCoo_1, tCoo_2)
	var steps_distance_tmp = fStepDist * 9/10
	if (Math.abs(fDist - target_distance) < minimum_distance)
	{
		return fTime_2
	}
	else if (fDist > target_distance)
	{
		return bGetStuff(fTime_1, fTime_2 - steps_distance_tmp * iSign, steps_distance_tmp, iSign)
	}
	else if (fDist < target_distance)
	{
		return bGetStuff(fTime_1, fTime_2 + steps_distance_tmp * iSign, steps_distance_tmp, iSign)
	}
	else
	{
		// this should never happen
		return fTime_2
	}
}

var fTime = 1/2
while (fTime <= 1)
{
	var thisCoo = tCoordinates(fTime)
	var thisDiv = tDerivatives(fTime)
	thisDiv = vnormalize(thisDiv)
	sOutString += '1 16 ' + thisCoo[0] + ' ' + thisCoo[1] + ' 0 ' + thisDiv[0] + ' ' + (-thisDiv[1]) + ' 0 ' + thisDiv[1] + ' ' + thisDiv[0] + ' 0 0 0 1 3004.dat\n'
	fTime = bGetStuff(fTime, fTime + steps_distance_big, steps_distance_big, 1)
}
/*
fTime = 1/2
var skip_first = true
while (fTime >= 0)
{
	if (skip_first == false)
	{
		var thisCoo = tCoordinates(fTime)
		WScript.Echo(fTime)
		sOutString += '1 16 ' + thisCoo[0] + ' ' + thisCoo[1] + ' 0 1 0 0 0 0 -1 0 1 0 3004.dat\n'
	}
	fTime = bGetStuff(fTime, fTime - steps_distance_big, steps_distance_big, -1)[0]
	skip_first = false
}
*/

//WScript.Echo(sOutString)

var OutputFileObject = fso.OpenTextFile('temp.ldr', 2, 1, 0)
OutputFileObject.Write(sOutString)
OutputFileObject.Close()
