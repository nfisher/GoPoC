class goagent($conf_file) {
	file { 'iptables':
		path => '/etc/sysconfig/iptables',
		ensure => file,
		group => root,
		owner => root,
		notify => Service['iptables'],
		source => "puppet:///modules/iptables/$conf_file",
	}

	service { 'iptables':
		ensure => running,
		enable => true,
		hasstatus => true,
		hasrestart => true,
	}
}
