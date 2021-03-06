class { 'apt': }
apt::ppa { 'ppa:webupd8team/java':}
 
exec { 'accept-java-license':
    command => '/bin/echo /usr/bin/debconf shared/accepted-oracle-license-v1-1 select true | sudo /usr/bin/debconf-set-selections;/bin/echo /usr/bin/debconf shared/accepted-oracle-license-v1-1 seen true | sudo /usr/bin/debconf-set-selections;'
} ->
package { 'oracle-java8-installer':
    ensure => present,
    require => Apt::Ppa['ppa:webupd8team/java']
} ->
package { 'oracle-java8-set-default':
    ensure => present,
    require => Package['oracle-java8-installer']
} -> 
augeas { "java home":
  context => "/files/etc/environment",
  changes => [
    "set JAVA_HOME /usr/lib/jvm/java-8-oracle",
  ],
}

