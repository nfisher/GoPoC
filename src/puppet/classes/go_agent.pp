class go_agent {
	package {"go-agent":
		provider => rpm,
		ensure => present,
		source => "http://download01.thoughtworks.com/go/2.4.0/ga/go-agent-2.4.0-14481.noarch.rpm",
		require => Class["jdk"],
	}
}
