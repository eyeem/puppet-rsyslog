# Puppet rsyslog

## Tested on...

* Debian 5 (Lenny)
* Debian 6 (Squeeze)

## Example usage

### Install RSyslog

    node /box/ {
      include rsyslog
    }

### Enable RSyslog server

    node /box/ {
      class { 'rsyslog':
        server => true;
      }
    }

### Adjust RSyslog server settings

    node /box/ {
      class { 'rsyslog':
        server            => true,
        server_tcp_enable => false,
        server_udp_enable => true,
      }
    }

### Log to remote server

    node /box/ {
      include rsyslog

      rsyslog::rule { 'remote':
        ensure  => present,
        content => "*.* @10.0.0.1:514";
      }
    }

### Log custom file to remote server

    node /box/ {
      include rsyslog

      rsyslog::inputfile { 'foobar':
        ensure             => present,
        inputfilename      => '/var/log/foobar',
        inputfiletag       => 'foobar',
        inputfilestatefile => "stat-${name}",
      }
    }

