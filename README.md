Hello.

This is a readme file of a BatLogRemover project.

There are tons of soft producing a very huge log files. That logs sometimes could be switched off formally, however few of users do it since logs sometimes turn out useful when some critical error has occured. BatLogRemover is a helpful batch that could be sent to (Windows) Task Scheduler and delete files by mask and *date older than* from desired directories.

BatLogRemover batch requires at least TWO (2) mandatory parameters for work. And another TWO (2*) optional parameters. Totally, FOUR (4). Parameters are passed within double quotes separated by spaces. Descriptions of parameters, so do examples are provided below:

&nbsp;&nbsp;1.&nbsp;depth - is an unsigned smallint parameter that describes on which depth from current date you wish to preserve files (defined in days);

&nbsp;&nbsp;2.&nbsp;file_with_dirs_control - a name of the file that is located in the same directory as BatLogRemover batch and contains a list of directories to observe and to clean. Every directory starts with the new line;

&nbsp;&nbsp;3*.&nbsp;look_for - optional parameter that describes filemasks of files shall be deleted from the directories list were described above, separated by comma ( , ). Every existing ( * ) symbol in filemask should be replaced by dollar symbol ( $ ), see examples. By default, mask "*. log" is used;

&nbsp;&nbsp;4*.&nbsp;log_file - is a name of file that will be created if absent for BatLogRemover batch processing logs within same directory where .bat is located. By default batch logs are on and stored in file FileCleanerLog.txt. If you would like to turn logs off, pass "0" or "false" with designated current parameter.

Examples:

1. Delete all xml and log (*.xml and *.log) files are older than 3 days from two directories.<br/>
	&nbsp;&nbsp;.txt file contains:<br/>
		&nbsp;&nbsp;&nbsp;&nbsp;D:\Work\BatLogRemover\12<br/>
		&nbsp;&nbsp;&nbsp;&nbsp;D:\Work\BatLogRemover\34 56<br/>
	&nbsp;&nbsp;Batch launch parameters:<br/>
		&nbsp;&nbsp;&nbsp;&nbsp;D:\Work\BatLogRemover\OldLogFileRemover.bat "depth=3" "file_with_dirs_control=dirs.txt" "look_for=$.log,$.xml"<br/>

2. Delete all files older than 1 day name of starting with Qry... (Qry*) from one single directory.<br/>
	&nbsp;&nbsp;taskremove.txt file contains:<br/>
		&nbsp;&nbsp;&nbsp;&nbsp;D:\Work\BatLogRemover\34 56<br/>
	&nbsp;&nbsp;Batch launch parameters:<br/>
		&nbsp;&nbsp;&nbsp;&nbsp;D:\Work\BatLogRemover\OldLogFileRemover.bat "depth=1" "file_with_dirs_control=taskremove.txt" "look_for=Qry$"
<br/>
BatLogRemover project is free of use (CPOL). I will be glad if while using BatLogRemover you will keep a small credits to an author in commentaries.

Also remember, that gratitude feels good, while currency supports good. :)

If you like BatLogRemover so much or it did come handy and saved you a lot of time (nerves), you may provide some support for me (appreciate for anything) with Qiwi: +7(nine-zero-four)6543257

Thanks for visiting and reading. Have a good luck!
