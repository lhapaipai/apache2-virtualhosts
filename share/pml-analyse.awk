/<VirtualHost/,/<\/VirtualHost/ {
  if ($1 == "<VirtualHost") {
    port = gensub(/^.*:([0-9]+).*$/, "\\1", "1", $2)
  }

  if ($1 == "ServerName") {
    DOMAIN = $2
  }
  if ($1 == "DocumentRoot") {
    DOCUMENT_ROOT = gensub(/^['"]+(.*)['"]+$/, "\\1", "1", $2)
  }
  if ($1 == "ErrorLog") {
    ERROR_LOG_FILE = gensub(/^['"]+(.*)['"]+$/, "\\1", "1", $2)
  }
  if ($1 == "CustomLog") {
    ACCESS_LOG_FILE = gensub(/^['"]+(.*)['"]+$/, "\\1", "1", $2)
  }

  if ($1 == "</VirtualHost>") {
    print DOMAIN, DOCUMENT_ROOT, ERROR_LOG_FILE, ACCESS_LOG_FILE
  }
}