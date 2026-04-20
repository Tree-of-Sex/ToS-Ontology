## Customize Makefile settings for toso
##
## If you need to customize your Makefile, make
## changes here rather than in the main Makefile

TOSO_CORE_TEMPLATE_URL="https://docs.google.com/spreadsheets/d/e/2PACX-1vQozVzOQ7GBW61gJEAJUl_0W6JbBbAeaG1Tj2WIBpLS9N8bL7XK1SYHnDe6K1Zz_3StlJ-G4hIcpfeX/pub?gid=0&single=true&output=tsv"

$(TEMPLATEDIR)/toso-core.tsv:
	wget $(TOSO_CORE_TEMPLATE_URL) -O $@

$(COMPONENTSDIR)/core.owl: $(TEMPLATEDIR)/toso-core.tsv $(TMPDIR)/stamp-component-core.owl
	$(ROBOT) template  \
		 --prefix "TOSO: http://w3id.org/toso/vocab/TOSO_" \
		 --template $(TEMPLATEDIR)/toso-core.tsv \
		 $(ANNOTATE_CONVERT_FILE)
.PRECIOUS: $(COMPONENTSDIR)/core.owl