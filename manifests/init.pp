
# This is the manifests init.pp file for class umucedu_conrepo,
# please do not modify.
class pm_dntp {

package { 'ntp':
  ensure    => latest,
}
service { 'ntpd':
  ensure    => running,
  before    => Package[ 'ntp' ],
}

file { '/root/ntp.conf':
  ensure    => file,
  owner     => 'root',
  group     => 'root',
  mode      => '0644',
  content   => 'puppet:///modules/pm_dntp/dev-ntp.conf',
  notify    => Service[ 'ntpd' ],
}
}
