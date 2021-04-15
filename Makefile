pdf_css = $(abspath ./assets/style.css)
template = $(abspath ./assets/page_template.html)
public_dir = $(abspath ./public)
pandoc_opts = --from markdown \
			  --resource-path=$(abspath ./assets) \
			  --self-contained \
			  --section-divs \
			  --template=$(template) \
			  --css $(pdf_css)

.PHONY: all clean site

all: site

clean:
	rm -rf $(public_dir)

$(public_dir)/index.html: index.md $(template)
	mkdir -p $(public_dir) && \
	pandoc $(pandoc_opts) $< -o $@ && \
	tr -d \\n < $@ > tmp.html && \
	mv tmp.html $@

site: clean $(public_dir)/index.html
