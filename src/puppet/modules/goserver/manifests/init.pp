class goserver {
	package { 'go-server':
		provider => rpm,
		ensure => present,
		source => 'http://download01.thoughtworks.com/go/2.4.0/ga/go-server-2.4.0-14481.noarch.rpm',
		require => [Class['jdk'], Class['unzip']],
	}
	
	file { 'htpasswd':
		path => '/etc/go/htpasswd',
		ensure => file,
		mode => '600',
		group => go,
		owner => go,
		source => 'puppet:///modules/goserver/htpasswd',
		require => Package['go-server'],
	}

	service { 'go-server':
		ensure => running,
		enable => true,
		hasstatus => true,
		hasrestart => true,
	}
}
