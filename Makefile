content_files = $(wildcard content/*.md)
pdf_css = $(abspath ./assets/style.css)
public_dir = $(abspath ./_build)
pandoc_opts = --from markdown \
			  --resource-path=$(abspath ./assets) \
			  --embed-resources \
			  --standalone \
			  --section-divs \
			  --toc \
			  --toc-depth=2 \
			  --css $(pdf_css)

.PHONY: all clean

all: clean $(public_dir)/favicon.ico $(public_dir)/index.html

clean:
	rm -rf $(public_dir)
	mkdir -p $(public_dir)

$(public_dir)/index.html: $(content_files) $(template)
	pandoc $(pandoc_opts) $(content_files) > $@

$(public_dir)/favicon.ico: assets/favicon.ico
	cp $< $@
