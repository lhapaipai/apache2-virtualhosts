# Manage Virtual Hosts

Just create and remove Virtual Hosts for your apache server. You can take advantage of the bash completion.

## Installation

you can run `sudo make install` 

or

- copy manually `a2*` files into your `/usr/local/bin/`
- copy `apache2-scripts` into `/etc/bash_completion.d/`

## Usage

### a2mksite

`a2mksite <domain>`

This command create a virtual host in your current working directory and add the domain to your hosts file.

### a2rmsite

`a2rmsite <domain>`

This command remove this domain from your virtual hosts and remove the domain from your hosts file.

### a2lssites

`a2lssites`

This command show all your virtual hosts (enabled are prefixed with *)

### a2info

`a2info <action>`

| Action  | Description                                               |
| ------- | --------------------------------------------------------- |
| logdir  | Get log directory (ex: /var/log/httpd )                   |
| confdir | Get config directory (ex: /etc/httpd/conf )               |
| user    | Get apache user name (ex: httpd )                         |
| certsdir| Get certs directory (ex: /etc/letsencrypt/live)           |
| init    | This command create your directories for your conf files. |



### a2ensite

`a2ensite <domain>`

### a2dissite

`a2dissite <domain>`

### a2mkssl

`a2mkssl <domain>`


## Uninstall

```bash
sudo make uninstall
```

