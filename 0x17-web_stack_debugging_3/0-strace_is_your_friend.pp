$file_to_edit = '/var/www/html/wp-settings.php'

file {'/var/www/html':
	ensure => directory,
	owner => 'www-data',
	group => 'www-data',
}

file {$file_to_edit:
	ensure => file,
	content => "<?php\n// wordPress settings\n\n// phpp typo causing Apache error\n\n?>",
	owner => 'www-data',
	group => 'www-data',
	mode => '0644',
}

exec {'repace_typo_in_wp_settings':
	command => "sed -i 's/phpp/php/g' ${file_to_edit}",
	path => ['/bin', '/usr/bin'],
	onlyif => "grep 'phpp' ${file_to_edit}",
	require => File[$file_to_edit],
}

service {'apache2':
	ensure => running,
	enable => true,
	require => Exec['replace_typo_in_wp_settings'],
}
