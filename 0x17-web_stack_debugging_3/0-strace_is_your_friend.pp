exec {'fix-apache-error':
	command => '/usr/bin/chown www-data:www-data /var/www/html',
	path => ['/bin', '/usr/bin'],
	unless => '/usr/bin/test -w /var/www/html',
}
