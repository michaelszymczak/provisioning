$username = "maikeru"
package { 'git': }
class { 'ohmyzsh': }
ohmyzsh::install { $username: }
ohmyzsh::theme { $username: theme => 'ys' }
ohmyzsh::plugins { $username: plugins => 'git github' }
