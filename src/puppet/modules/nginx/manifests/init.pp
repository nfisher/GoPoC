class nginx ($default_path = '/usr/share/nginx/html') {
	package { 'nginx-release-centos':
		provider => rpm,
		ensure => present,
		source => 'http://nginx.org/packages/centos/6/noarch/RPMS/nginx-release-centos-6-0.el6.ngx.noarch.rpm'
	}

	package { 'nginx':
		provider => yum,
		ensure => present,
		require => Package['nginx-release-centos'],
	}

	file { 'default':
		path => '/etc/nginx/conf.d/default.conf',
		ensure => file,
		mode => '644',
		group => root,
		owner => root,
		notify => Service['nginx'],
		content => template('nginx/default.conf.erb')
	}

	service { 'nginx':
		ensure => running,
		enable => true,
		hasstatus => true,
		hasrestart => true,
	}
}

