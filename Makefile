all: html 

MD_FILES := $(wildcard *.md)
MD_FILES := $(filter-out README.md, $(MD_FILES))

html: $(addsuffix .html,$(basename $(MD_FILES)))

R = bin/mkresume --stylesheet=css/resume.css --data=/home/erik/.resumedata.yaml

%.html: %.md css/resume.css bin/mkresume
	$(R) $< > $@.tmp && mv $@.tmp $@
	$(R) $< > $*-public.tmp && mv $*-public.tmp $*-public.html

clean:
	rm -f *.html

install: html
	cp $(MD_FILES) ~/public_html/resume/
	cp *.html ~/public_html/resume/

