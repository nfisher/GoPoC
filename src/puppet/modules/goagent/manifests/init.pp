class goagent($conf_file) {
	file { 'goagent':
		path => '/etc/defaults/go-agent',
		ensure => file,
		group => root,
		owner => root,
		notify => Service['go-agent'],
		source => "puppet:///modules/goagent/$conf_file",
	}

	service { 'go-agent':
		ensure => running,
		enable => true,
		hasstatus => true,
		hasrestart => true,
	}
}
