class mcollective-client {
	package { 'mcollective-client':
		provider => rpm,
		ensure => present,
		source => 'http://puppetlabs.com/downloads/mcollective/mcollective-client-1.2.1-1.el5.noarch.rpm',
		require => [Package['mcollective-common'], Package['rubygem-stomp']],
	}

	package { 'mcollective-common':
		provider => rpm,
		ensure => present,
		source => 'http://puppetlabs.com/downloads/mcollective/mcollective-common-1.2.1-1.el5.noarch.rpm',
	}

	package { 'rubygem-stomp': ensure => present }
}

