.PHONY: clean publish

all:
	Rscript update.R
	cp -r css _dist/

publish:
	rsync -dav _dist/ bobuss@tornil.net:~/www/cv/

clean:
	rm -f _dist/*

