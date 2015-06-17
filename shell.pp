$username = "maikeru"
package { 'git': ensure => present }
class { 'ohmyzsh': }
ohmyzsh::install { $username: }
ohmyzsh::theme { $username: theme => 'ys' }
ohmyzsh::plugins { $username: plugins => 'git github' }

package { 'tree': ensure => present }
