NAME=cheatsheet
INDEX=README.html
MD_DIR=../src
TMP_DIR=out
CHM=$(NAME).chm

PANDOC2HTML = pandoc.exe -s --template=pandoc-template-chm.html -c ../pandoc-markdown.css -f markdown_strict+escaped_line_breaks+backtick_code_blocks+pipe_tables+all_symbols_escapable-pandoc_title_block -t html

md2html=$(patsubst %.md,%.html,$(subst /,_,$(1)))
html2md=$(patsubst %.html,%.md,$(subst _,/,$(1)))

MDS = $(shell find "$(MD_DIR)" -name '*.md' -printf "%P\n")
HTMLS = $(call md2html,$(MDS))

.PHONY: all clean chm

all: chm
chm: $(CHM)

# hhc's exit code doesn't conform to bash,
# so we test it ourself.
$(CHM): $(addprefix $(TMP_DIR)/,$(HTMLS)) $(TMP_DIR)/$(INDEX)
	./chm.sh $(NAME) $(MD_DIR) $(INDEX) $(TMP_DIR)
	hhc.exe $(TMP_DIR)/$(NAME).hhp; test $$? -eq 1

$(TMP_DIR):
	mkdir -p $(TMP_DIR)

$(TMP_DIR)/$(INDEX): ../README.md $(TMP_DIR)
	$(PANDOC2HTML) $< | iconv -f utf-8 -t gbk -c >$@

define htmlrule
$(TMP_DIR)/$1: $(addprefix $(MD_DIR)/,$(call html2md,$1)) $(TMP_DIR)
	$(PANDOC2HTML) $$< | iconv -f utf-8 -t gbk -c >$$@
endef

$(foreach h,$(HTMLS),$(eval $(call htmlrule,$(h))))

clean:
	rm -rf $(TMP_DIR)
