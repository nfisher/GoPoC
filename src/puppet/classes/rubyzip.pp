class rubyzip {
	package { 'zip':
		ensure => present,
		provider => gem,
	}
}
