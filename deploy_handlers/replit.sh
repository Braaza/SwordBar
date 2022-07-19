#!/bin/bash

[ -z "$IS_SOURCE" ] || { python3 preview.py; kill "$PPID"; exit 1; }

bash quick_update.sh

if [ ! -d "venv" ]; then
  python3 -m venv venv
  . venv/bin/activate
  python3 -m pip install -U pip
  python3 -m pip install -r requirements.txt
  clear
else
  . venv/bin/activate
fi

python3 main.py