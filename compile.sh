#!/usr/bin/bash
HEADER=../src/template/header.tex
FOOTER=../src/template/footer.tex
FINAL_FILE=Book
mkdir pdf
cd pdf
touch $FINAL_FILE.tex
cat "$HEADER" >> $FINAL_FILE.tex
pandoc -f gfm  -t latex --top-level-division=chapter ../src/*.md >> $FINAL_FILE.tex
cat "$FOOTER" >> $FINAL_FILE.tex
pdflatex $FINAL_FILE.tex
pdflatex $FINAL_FILE.tex # Double compilation for the Table of Contents
rm $FINAL_FILE.log $FINAL_FILE.aux $FINAL_FILE.out $FINAL_FILE.tex
echo "Done"
