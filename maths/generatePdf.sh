for f in *.md; do pandoc -H config.pandoc "$f" -s -o pdf/"${f%.md}.pdf" -V fontsize=12pt -V geometry:margin=.5in; done
