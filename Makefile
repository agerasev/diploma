BUILD=build
MEDIA=media
SVG=$(shell find $(MEDIA) -name '*.svg')

PDF=$(addprefix $(BUILD)/, $(SVG:.svg=.pdf))

.phony: all mkbdir cpmedia finaldoc

all: mkbdir cpmedia finaldoc

mkbdir:
	mkdir -p $(BUILD)

cpmedia:
	cp -r $(MEDIA) $(BUILD)

finaldoc: diploma.tex $(PDF)
	cd $(BUILD); pdflatex ../$<; cd ..

$(PDF): $(BUILD)/%.pdf: %.svg
	inkscape $< --export-pdf=$@
