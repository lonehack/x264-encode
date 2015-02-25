# x264-encode
This is a simple script to run x264 for encode videos using Bash Script.
Make sure you have x264 in /usr/local/bin/ and x264-10bit in /usr/bin/

command: ./x264-encode.sh <bit-depth> <file_output> <file_input> <tuning>
ex: ./x264-encode.sh 10bit output.mkv input.mp4 animation
bit-depth available:
  - 8bit (for 8-bit depth)
  - 10bit (for 10-bit depth)
tuning available:
	- animation (for animation)
	- film (for film or movie)
Use [./x264-encode help] for help
