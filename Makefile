
JSCSS = assets/js/sgmp.tokeninput.js	\
	assets/js/sgmp.framework.js	\
	assets/js/sgmp.admin.js

MINJSCSS = $(patsubst %.js,%.min.js,$(JSCSS))

foo:
	echo JSCSS    = $(JSCSS)
	echo MINJSCSS = $(MINJSCSS)

all: README.md $(MINJSCSS)

$(MINJSCSS): %.min.js: %.js
	yui-compressor $< -o $@

assets/js/jquery.tools.tabs.min.js: assets/js/jquery.tools.tabs.js


README.md: readme.txt
	/usr/local/wp2md/vendor/bin/wp2md convert -i readme.txt -o README.md

update-pot:
	xgettext 						\
		--language=PHP --keyword=__ --keyword=_e	\
		--sort-by-file					\
		--copyright-holder="Norbert Preining <norbert@preining.info>" \
		--package-name=simple-google-map-plugin		\
		--output=languages/simple-google-map-plugin.pot	\
		*.php