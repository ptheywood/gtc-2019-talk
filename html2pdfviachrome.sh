#!/bin/bash

cd "$(dirname "$0")"

bs e presentation.md

google-chrome --headless --print-to-pdf="pdf/presentation-chrome.pdf"  dist/presentation.html
