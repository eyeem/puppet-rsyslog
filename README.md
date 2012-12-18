# Puppet rsyslog

## Requirements

* [concat module](https://github.com/ripienaar/puppet-concat)

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
      class {
        'rsyslog': server => true;
      }
    }

