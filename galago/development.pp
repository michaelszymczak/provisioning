# JVM
package { 'maven': ensure => present }
package { 'gradle': ensure => present }

augeas { "gradle home":
  require => Package['gradle'],
  context => "/files/etc/environment",
  changes => [
    "set GRADLE_HOME /usr/share/gradle",
  ],
}

# Other
package { 'mongodb': ensure => present }
package { 'ruby': ensure => present }
package { 'ruby-dev': ensure => present }


# Javascript
class { '::nodejs':
  manage_package_repo       => false,
  nodejs_dev_package_ensure => 'present',
  npm_package_ensure        => 'present',
}

file { '/usr/bin/node':
   ensure => 'link',
   target => '/usr/bin/nodejs',
   require => Package['npm'],
}

package { 'grunt-cli':
  ensure   => 'present',
  provider => 'npm',
  require => Package['npm'],
}
 
package { 'bower':
  ensure   => 'present',
  provider => 'npm',
  require => Package['npm'],
}
