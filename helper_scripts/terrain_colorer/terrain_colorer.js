var MssgDebug = false
var MssgVerbose = true
var ReplacementCount = 0
var FileCount = 0
var CanOverwrite = 0
var CanContinue = 0
var fso
var WshShell

// only continue if the script is run via Windows Scripting Host
if (typeof(WScript) != 'undefined')
{
	var ProgArgs = WScript.Arguments
	if ((ProgArgs.length < 1) || (ProgArgs.length > 2))
	{
		var usage_text = 
'Invalid number of parameters.\n\n' +
'cscript terrain_colorer.js [input path] [-o]\n\n' +
'[input path] may be a file or folder.\n' +
'[-o] specifies to overwrite the input files.'
		WScript.Echo(usage_text)
	}
	else if (ProgArgs.length == 1)
	{
		if (ProgArgs(0) != '-o')
		{
			CanContinue = 1
		}
	}
	else if (ProgArgs.length == 2)
	{
		if (ProgArgs(1) == '-o')
		{
			CanOverwrite = 1
			CanContinue = 1
		}
		else
		{
			WScript.Echo('Invalid parameter ' + ProgArgs(1))
		}
	}
	if (CanContinue)
	{
		var InputPath = ProgArgs(0)
		Get_Input(InputPath)
	}
}

function Get_Input(InputPath)
{
	fso = new ActiveXObject('Scripting.FileSystemObject')
	WshShell = new ActiveXObject('WScript.Shell')

	// list of valid file extensions
	var Test_a = /\.[lL][dD][rR]$/
	var Test_b = /\.[dD][aA][tT]$/

	try
	{
		fso.GetFile(InputPath)
		if (Test_a.test(InputPath) || Test_b.test(InputPath))
		{
			var InputRoot = InputPath.substring(0, InputPath.lastIndexOf('\\') + 1)
			var InputFile = InputPath
			if (InputRoot == '')
			{
				InputRoot = WshShell.CurrentDirectory + '\\'
				InputFile = InputRoot + InputPath
			}
			Convert_File(InputFile)
		}
		else
		{
			WScript.Echo('Invalid file type: input file must have an .ldr or .dat extension.')
		}
	}
	catch (e_1)
	{
		WScript.echo('Error: ' + e_2)
	}
}

function Convert_File(ThisFile)
{
	WScript.Echo('Processing file: ' + ThisFile)

	// read the input file and store its contents as a string
	var InputFileObject = fso.OpenTextFile(ThisFile, 1)
	var OutputFileString = ''
	var LineCount = 0

	while (!InputFileObject.AtEndOfStream)
	{
		LineCount += 1
		var OutColor = '13'
		if (LineCount % 2 == 1)
		{
			OutColor = '11'
		}
		var TempString = InputFileObject.ReadLine()
		var TempArray = TempString.split(' ')
		if (TempArray[0] == '3')
		{
			var NewTempString = ''
			for (var i = 0, n = TempArray.length; i < n; i++)
			{
				if (i == 1)
				{
					NewTempString += OutColor + ' '
				}
				else
				{
					NewTempString += TempArray[i] + ' '
				}
			}
			OutputFileString += NewTempString + '\r\n'
		}
		else
		{
			OutputFileString += TempString + '\r\n'
		}
	}

	InputFileObject.Close()

	// write a copy of the converted file
	var OutFile = ThisFile
	if (!CanOverwrite)
	{
		OutFile += '.new'
	}
	var OutputFileObject = fso.OpenTextFile(OutFile, 2, 1, 0)
	OutputFileObject.Write(OutputFileString)
	OutputFileObject.Close()

//	WScript.Echo('Done.')
}
