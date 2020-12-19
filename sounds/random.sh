#!/bin/sh
basedir=$(dirname "$0")

sleep 0.2 && \
AUDIODEV=dmix:CARD=Device \
  play -q $(find $basedir/$1 -type f | shuf -n1) -t alsa
