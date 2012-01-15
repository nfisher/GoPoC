class epel {
	package { 'epel-release':
		provider => rpm,
		ensure => present,
		source => 'http://download.fedoraproject.org/pub/epel/6/i386/epel-release-6-5.noarch.rpm',
	}
}

