package { 'maven': ensure => present }
package { 'mongodb': ensure => present }
package { 'ruby': ensure => present }
package { 'ruby-dev': ensure => present }
package { 'gradle': ensure => present }

augeas { "gradle home":
  require => Package['gradle'],
  context => "/files/etc/environment",
  changes => [
    "set GRADLE_HOME /usr/share/gradle",
  ],
}


class { '::nodejs':
  manage_package_repo       => false,
  nodejs_dev_package_ensure => 'present',
  npm_package_ensure        => 'present',
} ->
package { 'grunt-cli':
  ensure   => 'present',
  provider => 'npm',
} ->
file { '/usr/bin/node':
   ensure => 'link',
   target => '/usr/bin/nodejs',
}


