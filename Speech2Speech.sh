#!/bin/bash

# Dependencies:
# sox, whisper, ollama (phi3 model), say (in macos)

rec --buffer 2048 -b 16 output.wav silence 1 0.3 1% 1 2.0 1% > /dev/null 2>&1

OUTPUT=$(PYTHONWARNINGS="ignore" whisper "output.wav" --model small --language en)

OLLAMA=$(ollama run phi3-custom "$OUTPUT")

say "$OLLAMA"

sudo rm -rf output.json output.srt output.tsv output.txt output.vtt output.wav
