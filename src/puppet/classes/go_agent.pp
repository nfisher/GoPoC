class go_agent {
	package {"go-agent":
		provider => rpm,
		ensure => present,
		source => "http://download01.thoughtworks.com/go/2.3.1/ga/go-agent-2.3.1-14065.noarch.rpm",
		require => Class["jdk"],
	}
}
