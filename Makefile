PANDOC=/usr/local/bin/pandoc

PANDOC_OPTIONS=--standalone

.PHONY: all clean publish

all: index.html resume.docx resume.txt resume.rtf resume.odt resume.epub

clean:
	rm index.html resume.docx resume.txt resume.rtf resume.odt resume.epub

publish:
	rsync --delete -dav --exclude "ga.txt" --exclude ".git" --exclude ".gitignore" --exclude "LICENSE.txt" --exclude "README.md" . bobuss@tornil.net:~/www/cv/

# Files generation

index.html: resume.md
	$(PANDOC) $(PANDOC_OPTIONS) -c css/github.css -M pagetitle:"Bertrand Tornil's Resume" -H ga.txt -f markdown -t html5 -o $@ $<

resume.docx: resume.md
	$(PANDOC) $(PANDOC_OPTIONS) -f markdown -t docx -o $@ $<

resume.txt: resume.md
	$(PANDOC) $(PANDOC_OPTIONS) -f markdown+smart -t plain -o $@ $<

resume.rtf : resume.md
	$(PANDOC) $(PANDOC_OPTIONS) -f markdown -o $@ $<

resume.odt : resume.md
	$(PANDOC) $(PANDOC_OPTIONS) -f markdown -o $@ $<

resume.epub : resume.md
	$(PANDOC) $(PANDOC_OPTIONS) -M title:"Bertrand Tornil's Resume" -f markdown -t epub3 -o $@ $<
