class go_server {
	package {"go-server":
		provider => rpm,
		ensure => present,
		source => "http://download01.thoughtworks.com/go/2.4.0/ga/go-server-2.4.0-14481.noarch.rpm",
		require => [Class["jdk"], Class["unzip"]],
	}
}
