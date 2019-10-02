all: html 

html: $(addsuffix .html,$(basename $(wildcard *.md))) 

R = bin/mkresume --stylesheet=css/resume.css --data=/home/erik/.resumedata.yaml

%.html: %.md css/resume.css bin/mkresume
	$(R) $< > $@.tmp && mv $@.tmp $@

clean:
	rm -f *.html

install: html
	cp resume.md ~/public_html/resume/
	cp resume.html ~/public_html/resume/

