#class to install packages
class mirror_repos::install {
  package { $mirror_repos::packages:
    ensure => present,
  }
}
