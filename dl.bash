#!/bin/bash

headers="$1"

itemFile="$2"
logFile="$3"

videoStream="$4"
audioStream="$5"
audioStream2="$6"

if [ -n "$audioStream" ]
then
  if [ -n "$audioStream2" ]
  then
    if [ -n "$subtitle" ]
	then
	  if [ -n "$subtitle2" ]
	  then
	    ffmpeg -headers "$headers" -i "$videoStream" -i "$audioStream" -i "$audioStream2" -i "$subtitle" -i "$subtitle2" -map 0:v -map 1:a -map 2:a -map 3:s -map 4:s -codec copy -shortest -y "$itemFile" </dev/null >/dev/null 2> "$logFile" &
	  else
	    ffmpeg -headers "$headers" -i "$videoStream" -i "$audioStream" -i "$audioStream2" -i "$subtitle" -map 0:v -map 1:a -map 2:a -map 3:s -codec copy -shortest -y "$itemFile" </dev/null >/dev/null 2> "$logFile" &
	  fi
	else
	  ffmpeg -headers "$headers" -i "$videoStream" -i "$audioStream" -i "$audioStream2" -map 0:v -map 1:a -map 2:a -codec copy -shortest -y "$itemFile" </dev/null >/dev/null 2> "$logFile" &
	fi
  elif [ -n "$subtitle" ]
  then
	if [ -n "$subtitle2" ]
	then
	  ffmpeg -headers "$headers" -i "$videoStream" -i "$audioStream" -i "$subtitle" -i "$subtitle2" -map 0:v -map 1:a -map 3:s -map 4:s -codec copy -shortest -y "$itemFile" </dev/null >/dev/null 2> "$logFile" &
	else
	  ffmpeg -headers "$headers" -i "$videoStream" -i "$audioStream" -i "$subtitle" -map 0:v -map 1:a -map 3:s -codec copy -shortest -y "$itemFile" </dev/null >/dev/null 2> "$logFile" &
	fi
  else
	ffmpeg -headers "$headers" -i "$videoStream" -i "$audioStream" -map 0:v -map 1:a -codec copy -shortest -y "$itemFile" </dev/null >/dev/null 2> "$logFile" &
  fi
else
  ffmpeg -headers "$headers" -i "$videoStream" -codec copy -y "$itemFile" </dev/null >/dev/null 2> "$logFile" &
fi
