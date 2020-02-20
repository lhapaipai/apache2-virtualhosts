install: copy-scripts copy-completion

uninstall: rm-scripts rm-completion

copy-scripts: a2ensite a2dissite a2lssites a2init a2mksite a2rmsite
	cp $^ /usr/local/bin/

copy-completion: apache2-scripts
	cp $< /etc/bash_completion.d/

rm-scripts: a2ensite a2dissite a2lssites a2init a2mksite a2rmsite
	rm $(addprefix /usr/local/bin/,$^)

rm-completion: apache2-scripts
	rm $(addprefix /etc/bash_completion.d/,$^)

