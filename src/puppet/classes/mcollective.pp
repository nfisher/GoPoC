class mcollective {
	package { 'mcollective':
		provider => rpm,
		ensure => present,
		source => 'http://puppetlabs.com/downloads/mcollective/mcollective-1.2.1-1.el5.noarch.rpm',
		require => [Package['mcollective-common'], Package['rubygem-stomp']],
	}
}

