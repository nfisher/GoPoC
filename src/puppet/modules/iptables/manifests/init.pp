class iptables($conf_file) {
	file { 'iptables':
		path => '/etc/sysconfig/iptables',
		ensure => file,
		mode => '600',
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
