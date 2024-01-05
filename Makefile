all: pdf

MD_FILES := $(wildcard *.md)
MD_FILES := $(filter-out README.md, $(MD_FILES))

html: resume.md css/resume.css resumedata-public.yaml $(addsuffix .html,$(basename $(MD_FILES)))

pdf: html ErikStambaugh.pdf

#R = bin/mkresume --stylesheet=css/resume.css --data=/home/erik/.resumedata.yaml

R = bin/mkresume
CSS_ARGS = --stylesheet=css/resume.css
PRIV_ARGS = --data=/home/erik/.resumedata.yaml
PUB_ARGS = --data=resumedata-public.yaml
TARGET_DIR = ~/resume_public/

%.html: %.md css/resume.css bin/mkresume
	$(R) $(CSS_ARGS) $(PRIV_ARGS) $< > $@.tmp && mv $@.tmp $@
	$(R) $(CSS_ARGS) $(PUB_ARGS) $< > $*-public.tmp && mv $*-public.tmp $*-public.html



%.pdf: html
	chromium \
		--headless \
		--run-all-compositor-stages-before-draw \
		--disable-gpu \
		--no-pdf-header-footer \
		--print-to-pdf-no-header \
		--print-to-pdf=$@ \
		resume.html

clean:
	rm -f *.html

install: html pdf $(TARGET_DIR)
	cp $(MD_FILES) $(TARGET_DIR)
	cp *.html $(TARGET_DIR)
	cp *.pdf $(TARGET_DIR)

