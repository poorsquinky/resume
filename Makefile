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

dev:
	while true; do inotifywait -e modify resume.md resumedata* css/resume.css bin/mkresume ; make; done


%.pdf: html
	# all this junk is because chromium is in a snap, ugh
	mkdir -p ~/.pdftmp
	cp resume.html ~/.pdftmp
	cd ~/.pdftmp && \
	chromium \
		--headless \
		--run-all-compositor-stages-before-draw \
		--disable-gpu \
		--no-pdf-header-footer \
		--print-to-pdf-no-header \
		--print-to-pdf=$@ \
		resume.html
	mv ~/.pdftmp/$@ .
	#
	
	# dupe to make a public version of the PDF
	cp resume-public.html ~/.pdftmp
	cd ~/.pdftmp && \
	chromium \
		--headless \
		--run-all-compositor-stages-before-draw \
		--disable-gpu \
		--no-pdf-header-footer \
		--print-to-pdf-no-header \
		--print-to-pdf=$*-public.pdf \
		resume-public.html
	mv ~/.pdftmp/$*-public.pdf .

clean:
	rm -f *.html

install: html pdf $(TARGET_DIR)
	cp $(MD_FILES) $(TARGET_DIR)
	cp *.html $(TARGET_DIR)
	cp *.pdf $(TARGET_DIR)

