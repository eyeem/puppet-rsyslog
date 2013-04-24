# = Class rsyslog::install
#
class rsyslog::install {
  package { $::rsyslog::pkg_list:
    ensure => $::rsyslog::pkg_ensure,
  }

  if $::rsyslog::pkg_deps {
    package { $::rsyslog::pkg_deps:
      ensure => $::rsyslog::pkg_ensure,
      before => Package[$::rsyslog::pkg_list],
    }
  }
}

