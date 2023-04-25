PANDOC=/usr/local/bin/pandoc

PANDOC_OPTIONS=--standalone

.PHONY: all clean publish

all: _dist/index.html _dist/resume.docx _dist/resume.txt _dist/resume.rtf _dist/resume.odt _dist/resume.epub

clean:
	rm -fr _dist/*

publish:
	rsync -dav _dist/ bobuss@tornil.net:~/www/cv/


# Files generation

_dist/index.html: resume.md
	$(PANDOC) $(PANDOC_OPTIONS) -c css/github.css -M pagetitle:"Bertrand Tornil's Resume" -f markdown -t html5 -o $@ $<
	cp -r css _dist/
	cp -r images _dist/

_dist/resume.docx: resume.md
	$(PANDOC) $(PANDOC_OPTIONS) -f markdown -t docx -o $@ $<

_dist/resume.txt: resume.md
	$(PANDOC) $(PANDOC_OPTIONS) -f markdown+smart -t plain -o $@ $<

_dist/resume.rtf : resume.md
	$(PANDOC) $(PANDOC_OPTIONS) -f markdown -o $@ $<

_dist/resume.odt : resume.md
	$(PANDOC) $(PANDOC_OPTIONS) -f markdown -o $@ $<

_dist/resume.epub : resume.md
	$(PANDOC) $(PANDOC_OPTIONS) -M title:"Bertrand Tornil's Resume" -f markdown -t epub3 -o $@ $<
