#!/usr/bin/bash
#VERSION 1
#rm Cole_Baty*.html Cole_Baty*.rtf Cole_Baty*.zip 2>/dev/null
#cwd=${PWD##*/}
#vim -c TOhtml *.cpp -c wq -c wq && unoconv -f rtf *.html && zip Cole_Baty_$cwd.zip *.cpp *.rtf *.docx
#for n in *.cpp; do vim -c TOhtml $n -c wq -c wq; done && unoconv -f rtf *.html && zip Cole_Baty_$cwd.zip *.cpp *.rtf *.docx

#VERSION 2
#remove older versions of files
find . | rm $(egrep "(.html|.rtf|.zip)$") 2>/dev/null

#convert all files of interest into HTML using TOhtml function in vim
#errors/warnings suppressed to /dev/null; otherwise shell gets weird
find . | for n in $(egrep "(.cpp|.h)$"); do vim -c TOhtml $n -c wq -c wq;done 2>/dev/null

#convert all HTML files into RTF files using LibreOffice's unoconv command
find . | unoconv -f rtf $(egrep ".html$");

#uncomment to reset tty in case something throws erros and makes the screen all funky
#stty sane

#grab current working directory name; i.e. /path/to/dir => dir
cwd=${PWD##*/}

#zip everything together
#find . | for n in $(egrep "(.cpp|.h|.rtf|.docx)$"); do zip Cole_Baty_$cwd.zip $n; done
find . | zip Cole_Baty_$cwd $(egrep "(.cpp|.h|.rtf|.docx)$")
