content_files = $(wildcard content/*.md)
pdf_css = $(abspath ./assets/style.css)
public_dir = $(abspath ./public)
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
	rm -f /tmp/full.md
	rm -rf $(public_dir)
	mkdir -p $(public_dir)

$(public_dir)/index.html: /tmp/full.md $(template)
	pandoc $(pandoc_opts) $< -o $@

$(public_dir)/favicon.ico: assets/favicon.ico
	cp $< $@

/tmp/full.md: $(content_files)
	m4 $< > $@
