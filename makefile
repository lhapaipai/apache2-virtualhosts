install:
	cp a2ensite a2dissite a2lssites a2info a2mksite a2rmsite pml-update-config a2chown-mod a2mkssl\
		/usr/local/bin/

	mkdir -p /usr/share/a2-virtualhosts
	cp -r share/* /usr/share/a2-virtualhosts

	cp share/apache.bash_completion /etc/bash_completion.d/

uninstall:
	rm -f /usr/local/bin/{a2ensite,a2dissite,a2lssites,a2info,a2mksite,a2mkssl,a2rmsite,pml-update-config,a2chown-mod}
	rm -f /etc/bash_completion.d/apache.bash_completion
	rm -fr /usr/share/a2-virtualhosts


