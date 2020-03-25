

/<VirtualHost/,/<\/VirtualHost/ {

  if ($1 == "<VirtualHost") {
    port = gensub(/^.*:([0-9]+).*$/, "\\1", "1", $2)
  }

  if ($1 == "ServerName") {
    server = $2
  }
  if ($1 == "DocumentRoot") {
    documentRoot = substr($2, 2, length($2) - 2)
    documentRoot = gensub("^" ENVIRON["HOME"], "~", "1", documentRoot)
  }

  if ($1 == "</VirtualHost>") {
    ENABLED_PATH = gensub( "sites-available", "sites-enabled", "1", FILENAME)
    if ( system("[ -L " ENABLED_PATH " ]") == 0 ) {
      enabled = "\033[32m●\033[0m"
    } else {
      enabled = "\033[31m●\033[0m"
    }

    if (port == "443") {
      protocol = "https://"
    } else {
      protocol = "http://"
    }

    if (port != "443" && port != "80") {
      server = server ":" port
    }
    printf("%s %-60s %s\n", enabled, protocol server, documentRoot)
  }
}  
