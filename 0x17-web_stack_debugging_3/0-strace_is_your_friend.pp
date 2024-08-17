# Puppet menuscript to replace a line

$file_to_edit = '/var/www/html/wp-settings.php'

#replace line

exec {'fix-wordpress':
	command => "sed -i 's/phpp/php/g' ${file_to_edit}",
	path => ['/bin', '/usr/bin'],
	onlyif => "grep -q 'phpp' ${file_to_edit}",
}

service {'apache2':
	ensure => 'running',
	subscribe => Exec['fix-wordpress'],
	require => Exec['fix-wordpress'],
}
