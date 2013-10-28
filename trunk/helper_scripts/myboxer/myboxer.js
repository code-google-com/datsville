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
'cscript myboxer.js [input path] [-o]\n\n' +
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

	// read the list of boxes and store its contents as an array
	WScript.Echo(WshShell.CurrentDirectory)
	var BoxListPath = WshShell.CurrentDirectory + '\\box_list.ini'
	var BoxListObject = fso.OpenTextFile(BoxListPath, 1)
	var BoxListString = BoxListObject.ReadAll()
	BoxListObject.Close()	
	BoxListArray = BoxListString.split('\r\n')

	// list of valid file extensions
	var Test_a = /\.[mM][pP][dD]$/
	var Test_b = /\.[lL][dD][rR]$/
	var Test_c = /\.[dD][aA][tT]$/

	try
	{
		fso.GetFile(InputPath)
		if (Test_a.test(InputPath) || Test_b.test(InputPath) || Test_c.test(InputPath))
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
			WScript.Echo('Invalid file type: input file must have an .ldr, .mpd or .dat extension.')
		}
	}
	catch (e_1)
	{
		try
		{
			fso.GetFolder(InputPath)
			var InputRoot = InputPath
			var FolderObject = fso.GetFolder(InputRoot)
			var FilesCollection = new Enumerator(FolderObject.files);
			while (!FilesCollection.atEnd())
			{
				var InputItem = FilesCollection.item()
				var InputFile = InputItem.Path
				if (Test_a.test(InputFile) || Test_b.test(InputFile) || Test_c.test(InputFile))
				{
					Convert_File(InputFile)
				}
//				else
//				{
//					WScript.Echo('Skipping file: ' + InputFile)
//				}
				FilesCollection.moveNext()
			}
		}
		catch (e_2)
		{
			WScript.echo('Error: ' + e_2)
		}
	}
	WScript.Echo(ReplacementCount + ' lines checked in ' + FileCount + ' files.')
}

function Convert_File(ThisFile)
{
	WScript.Echo('Processing file: ' + ThisFile)

	// read the input file and store its contents as a string
	var InputFileObject = fso.OpenTextFile(ThisFile, 1)
	var OutputFileString = ''

	while (!InputFileObject.AtEndOfStream)
	{
		var TempString = InputFileObject.ReadLine()
		for (var i = 0, n = BoxListArray.length; i < n; i++)
		{
			var CheckFirst = /[Bb]\\/
			var ThisBox = BoxListArray[i]
			if ((ThisBox != '') && (!CheckFirst.test(TempString)))
			{
				TempString = TempString.replace(' ' + ThisBox, ' b\\' + ThisBox)
				ReplacementCount += 1
			}
		}
		OutputFileString += TempString + '\n'
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
	FileCount += 1
}
