# = Class rsyslog::install
#
class rsyslog::install {
  package { $::rsyslog::pkg_list:
    ensure => $::rsyslog::pkg_ensure,
  }

  if $::rsyslog::pkg_deps {
    package { $::awstats::pkg_deps:
      ensure => $::awstats::pkg_ensure,
      before => Package[$::rsyslog::pkg_list],
    }
  }
}

