class goagent($go_server = "10.0.0.2") {
	package {"go-agent":
		provider => rpm,
		ensure => present,
		source => "http://download01.thoughtworks.com/go/2.4.0/ga/go-agent-2.4.0-14481.noarch.rpm",
		require => Class["jdk"],
	}

	file { '/etc/default/go-agent':
		ensure => file,
		mode => '644',
		group => go,
		owner => go,
		require => Package["go-agent"],
		notify => Service['go-agent'],
		content => template("goagent/go-agent.erb"),
	}

	service { 'go-agent':
		ensure => running,
		enable => true,
		hasstatus => true,
		hasrestart => true,
	}
}
