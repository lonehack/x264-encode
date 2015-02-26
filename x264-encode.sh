#!/bin/sh

## lonehack encoding script for x264 and x264-10bit
# ./x264-encode.sh <bit-depth> <file_output> <file_input> <tuning>
# ex. ./x264-encode.sh 10 output.mkv input.mp4 animation

# Variable used
E="$1"		#(bit-depth)
FILEOUT="$2" 	#(output file)
FILEIN="$3"	#(input file)
TUNE="$4"	#(tuning)

# Config
PROF="high10"
LVL=5.2
CRF=23
SC=45
BF=8
# see [x264 --fullhelp] for details

# Command checking
R=0
H=0
ERROR=0
if [ -n "$E"  -a "$E" != "help" ]
then
	if [ -n "$FILEOUT" -a -n "$FILEIN" -a -n "$TUNE" ]
	then
		if [ "$E" =  "8bit" ]
		then
			R=1
			ENC="/usr/local/bin/x264"
		elif [ "$E" = "10bit" ]
		then
			R=1
			ENC="/usr/bin/x264-10bit"
		else
			echo "ERROR!!"
			echo "bit-depth not supported"
			echo "or check your VideoLAN x264 installation"
			echo "Encoding failed!!"
		fi
	else
		ERROR=1
	fi
elif [ "$E" = "help" ]
then
	H=1
else
	ERROR=1
fi
# Script :
if [ $R -eq 1 ]
then
	$ENC --profile $PROF --level $LVL --preset veryslow --tune $TUNE --crf $CRF --min-keyint 12 --scenecut $SC --bframe $BF --b-adapt 2 --ref 10 --weightp 2 --qpmin 10 --qpmax 51 --qcomp 0.6 --rc-lookahead 40 --direct auto --aq-mode 3 --aq-strength 0.8 --merange 24 --me umh --subme 10 --trellis 2 --psy-rd 0.40:0.60 --output $FILEOUT $FILEIN
	echo "$FILEIN encoding done!"
fi
# Help messege
if [ $H -eq 1 ]
then
	echo "lonehack encoding script for x264 and x264-10bit"
	echo "make sure you have x264 and x264-10bit installed in tour system"
	echo "command: ./x264-encode.sh <bit-depth> <file_output> <file_input> <tuning>"
	echo "ex: ./x264-encode.sh 10bit output.mkv input.mp4 animation"
	echo "bit-depth available:"
	echo "	- 8bit (for 8-bit depth)"
	echo "	- 10bit (for 10-bit depth)"
	echo "tuning available:"
	echo "	- animation (for animation)"
	echo "	- film (for film or movie)"
fi
# Error messege
if [ $ERROR -eq 1 ]
then
	echo "ERROR!!"
	echo "Wrong command used!"
	echo "for help use: ./x264-encode.sh help"
fi
