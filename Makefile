pdf_css = $(abspath ./assets/style.css)
template = $(abspath ./assets/page_template.html)
public_dir = $(abspath ./public)
pandoc_opts = --from markdown \
			  --resource-path=$(abspath ./assets) \
			  --self-contained \
			  --section-divs \
			  --template=$(template) \
			  --toc --toc-depth=2 \
			  --css $(pdf_css)

.PHONY: all clean site deploy

all: clean $(public_dir)/index.html

clean:
	rm -f fullsite.md
	rm -rf $(public_dir)

$(public_dir)/%.html: fullsite.md  $(template)
	mkdir -p $(public_dir) && \
	pandoc $(pandoc_opts) $< -o $@ && \
	tr -d \\n < $@ > tmp.html && \
	mv tmp.html $@

fullsite.md: content/*.md
	m4 $< > $@

deploy: all
	scp public/* tilde.club:public_html/
