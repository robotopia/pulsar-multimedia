#!/bin/bash

vid1=../../blender/real_data/out.mpg
vid2=timeseries.mpg

# Got this from http://www.ffmpeg.org/ffmpeg-all.html#overlay-1
ffmpeg -i $vid1 -i $vid2 -filter_complex "
nullsrc=size=960x940 [background];
[0:v] setpts=PTS-STARTPTS, scale=960x540 [top];
[1:v] setpts=PTS-STARTPTS, scale=960x400 [bottom];
[background][top]        overlay=shortest=1       [background+top];
[background+top][bottom] overlay=shortest=1:y=540
" -q:v 1 combined.mpg
