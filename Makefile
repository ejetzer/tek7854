me := $(lastword $(MAKEFILE_LIST))

python = python3.14
latexmk = latexmk

rst_source = Lisez-moi.rst

build_dir = build
lib_dir = lib
me_dir := $(abspath $(dir $(me)))
export_dir := $(abspath $(me_dir)/..)

rst2html = $(lib_dir)/rst2html5.py
rst2latex = $(lib_dir)/rst2latex.py
latexmkrc = latexmkrc

html := $(export_dir)/Lisez-moi.html
pdf := $(export_dir)/Lisez-moi.pdf
targets :=  $(html) $(pdf)

all: $(targets)

html: $(html)

pdf: $(pdf)
	
$(targets): $(export_dir)/%: $(build_dir)/%
	cp $< $@

$(build_dir)/%.html: %.rst
	$(python) $(rst2html) -g -d --no-source-link -q -l fr $< --output=$@

$(build_dir)/%.pdf: $(build_dir)/%.tex
	$(latexmk) -cd -gg -r $(latexmkrc) $<

$(build_dir)/%.tex: %.rst
	$(python) $(rst2latex) -g -d --no-source-link -q -l fr $< --output=$@

clean:
	$(latexmk) -r $(latexmkrc) -C
	rm -rf $(build_dir)/*