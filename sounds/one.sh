#!/bin/sh
basedir=$(dirname "$0")

sleep 0.25 && \
AUDIODEV=dmix:CARD=Device \
  play -q $basedir/$1 -t alsa
