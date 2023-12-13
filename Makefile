all: html

MD_FILES := $(wildcard *.md)
MD_FILES := $(filter-out README.md, $(MD_FILES))

html: resume.md css/resume.css resumedata-public.yaml $(addsuffix .html,$(basename $(MD_FILES)))

#R = bin/mkresume --stylesheet=css/resume.css --data=/home/erik/.resumedata.yaml

R = bin/mkresume
CSS_ARGS = --stylesheet=css/resume.css
PRIV_ARGS = --data=/home/erik/.resumedata.yaml
PUB_ARGS = --data=resumedata-public.yaml

%.html: %.md css/resume.css bin/mkresume
	$(R) $(CSS_ARGS) $(PRIV_ARGS) $< > $@.tmp && mv $@.tmp $@
	$(R) $(CSS_ARGS) $(PUB_ARGS) $< > $*-public.tmp && mv $*-public.tmp $*-public.html

clean:
	rm -f *.html

install: html
	cp $(MD_FILES) ~/public_html/resume/
	cp *.html ~/public_html/resume/

