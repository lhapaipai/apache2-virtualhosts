BEGIN {
  printf("<VirtualHost *:80>\n  ServerName %s\n  Redirect \"/\" \"https://%s\"\n</VirtualHost>\n", domain, domain);
}

/<VirtualHost/ {
  print "<VirtualHost *:443>"
  next
}

/<\/VirtualHost>/ {
  printf("  SSLCertificateFile %s/%s/fullchain.pem\n", certs_dir, domain);
  printf("  SSLCertificateKeyFile %s/%s/privkey.pem\n", certs_dir, domain);

  if (letsencrypt == "1") {
    print "  Include /etc/letsencrypt/options-ssl-apache.conf"
  }

}

{
  print $0;
}