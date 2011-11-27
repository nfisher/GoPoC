class unzip {
	package {"unzip":
		provider => yum,
		ensure => present,
	}
}
