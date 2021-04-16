pdf_css = $(abspath ./assets/style.css)
template = $(abspath ./assets/page_template.html)
public_dir = $(abspath ./public)
pandoc_opts = --from markdown \
			  --resource-path=$(abspath ./assets) \
			  --self-contained \
			  --section-divs \
			  --template=$(template) \
			  --css $(pdf_css)

.PHONY: all clean site deploy

all: clean $(public_dir)/index.html $(public_dir)/life_kanban.html $(public_dir)/readings_kanban.html

clean:
	rm -rf $(public_dir)

$(public_dir)/%.html: content/%.md $(template)
	mkdir -p $(public_dir) && \
	pandoc $(pandoc_opts) $< -o $@ && \
	tr -d \\n < $@ > tmp.html && \
	mv tmp.html $@

deploy: all
	scp public/* tilde.club:public_html/
