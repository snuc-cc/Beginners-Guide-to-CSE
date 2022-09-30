#!/usr/bin/bash
HEADER=src/template/header.txt
FOOTER=src/template/footer.txt
FINAL_FILE=Book
touch $FINAL_FILE.tex
cat "$HEADER" >> $FINAL_FILE.tex
pandoc -f gfm  -t latex --top-level-division=section src/*.md >> $FINAL_FILE.tex
cat "$FOOTER" >> $FINAL_FILE.tex
pdflatex $FINAL_FILE.tex
rm $FINAL_FILE.log $FINAL_FILE.aux $FINAL_FILE.out $FINAL_FILE.tex
echo "Done"
