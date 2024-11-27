src_dir		  := src
src_files	  := $(wildcard $(src_dir)/*.md)
css			  := $(abspath ./assets/style.css)
public_dir	  := $(abspath ./public_html)
template_file := $(abspath ./assets/templates/custom.html)
website		  := $(public_dir)/index.html
pandoc_opts	  := --from markdown \
				 --resource-path=$(abspath ./assets) \
				 --embed-resources \
				 --data-dir=$(abspath ./assets) \
				 --standalone \
				 --section-divs \
				 --template=custom \
				 --toc \
				 --toc-depth=2 \
				 --css $(css)

.PHONY: clean

all: clean $(public_dir)/favicon.ico $(website)

clean:
	rm -rf $(public_dir)
	mkdir -p $(public_dir)

$(website): $(src_files) $(css) $(template_file)
	m4 $(src_dir)/index.md | pandoc $(pandoc_opts) > $@

$(public_dir)/favicon.ico: assets/favicon.ico
	cp $< $@
