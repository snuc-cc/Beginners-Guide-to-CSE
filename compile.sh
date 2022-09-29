#!/usr/bin/bash
touch Book.tex
# Insert template
pandoc -f gfm  -t latex --top-level-division=section src/*.md >> Book.tex
echo "Done"
