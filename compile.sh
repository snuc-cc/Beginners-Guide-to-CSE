#!/usr/bin/bash

## Environmental Variables

HEADER=/src/template/header.tex
FOOTER=/src/template/footer.tex
FINAL_FILE=Book

# Creating the TEX File
touch $FINAL_FILE.tex

# Adding the Header, Body and the Footer to the .tex Filei
cat "$HEADER" >> $FINAL_FILE.tex
pandoc -f gfm  -t latex --top-level-division=chapter src/*.md >> $FINAL_FILE.tex
cat "$FOOTER" >> $FINAL_FILE.tex

# Converting the .tex File to .pdf using pdflatex
pdflatex $FINAL_FILE.tex

# Double compilation for the Table of Contents
pdflatex $FINAL_FILE.tex

# Removing the Unneccesary Files (.log | .aux | .out | .tex)
rm $FINAL_FILE.log $FINAL_FILE.aux $FINAL_FILE.out $FINAL_FILE.tex
echo "Done"
