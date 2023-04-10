content_files = $(wildcard content/*.md)
pdf_css = $(abspath ./assets/style.css)
template = $(abspath ./assets/page_template.html)
public_dir = $(abspath ./public)
pandoc_opts = --from markdown \
			  --resource-path=$(abspath ./assets) \
				--embed-resources --standalone \
			  --section-divs \
			  --template=$(template) \
			  --toc --toc-depth=2 \
			  --css $(pdf_css)

.PHONY: all clean site deploy dev

all: clean $(public_dir)/index.html

clean:
	rm -f /tmp/full.md
	rm -rf $(public_dir)
	mkdir -p $(public_dir)

$(public_dir)/index.html: /tmp/full.md $(template)
	pandoc $(pandoc_opts) $< -o $@

/tmp/full.md: $(content_files)
	m4 $< > $@

deploy: all
	scp -r public/* tilde.club:public_html/

dev: all
	cd public && python -m http.server
