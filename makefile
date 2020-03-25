install: copy-scripts copy-completion copy-share

uninstall: rm-scripts rm-completion rm-share

copy-share: share/*
	mkdir -p /usr/share/a2-virtualhosts
	cp -r $^ /usr/share/a2-virtualhosts

copy-scripts: a2ensite a2dissite a2lssites a2info a2mksite a2rmsite
	cp $^ /usr/local/bin/

copy-completion: apache2-scripts
	cp $< /etc/bash_completion.d/

rm-scripts: a2ensite a2dissite a2lssites a2info a2mksite a2rmsite
	rm $(addprefix /usr/local/bin/,$^)

rm-completion: apache2-scripts
	rm $(addprefix /etc/bash_completion.d/,$^)

rm-share:
	rm -r /usr/share/a2-virtualhosts