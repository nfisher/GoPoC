class iptables($tcp_ports = [], $udp_ports = []) {
	file { 'iptables':
		path => '/etc/sysconfig/iptables',
		ensure => file,
		mode => '600',
		group => root,
		owner => root,
		notify => Service['iptables'],
		content => template('iptables/services.erb')
	}

	service { 'iptables':
		ensure => running,
		enable => true,
		hasstatus => true,
		hasrestart => true,
	}
}
