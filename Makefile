# LaTeX Makefile v0.33 -- LaTeX only
# credits: https://scaron.info/blog/makefiles-for-latex.html
# use real tabs (:set et in vim), see https://stackoverflow.com/questions/27140035/makefile-missing-separator-but-have-hard-tab

PAPER=hroot-doku.tex  # set the path to your TeX file here
SHELL=/bin/bash   # for the while loop below

all:  ## Compile paper
	rubber --pdf $(PAPER)

install:
	@echo Copy files to network share
	@cp ./*.pdf /home/weiss/mnt/FB02-Pfeiffer-Team1/09_DecIS_Lab/hroot/

clean:  ## Clean output files
	rubber --clean $(PAPER)

watch:  ## Recompile on updates to the source file
	# needs inotify-tools to be installed
	@while true; do inotifywait $(PAPER); sleep 0.01; make all; done
    # for zsh users, replace the while loop with the following
    # @while [ 1 ]; do; inotifywait $(PAPER); sleep 0.01; make all; done