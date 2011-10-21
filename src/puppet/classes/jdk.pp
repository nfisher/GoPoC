class jdk {
	package{'jdk':
		provider => rpm,
		ensure => installed,
		source => "http://download.oracle.com/otn-pub/java/jdk/7/jdk-7-linux-i586.rpm",
	}
}
