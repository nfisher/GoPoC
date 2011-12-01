class rubybundler {
	package { "gcc": 
		ensure => present,
		provider => yum,
	}
	package { "ruby-devel":
		ensure => present,
		provider => yum,
	}
	package { "libxml2-devel":
		ensure => present,
		provider => yum,
	}
	package { "libxslt-devel":
		ensure => present,
		provider => yum,
	}

	package { "bundler":
		ensure => present,
		provider => gem,
		require => [Package["ruby-devel"],Package["gcc"]],
	}
}

