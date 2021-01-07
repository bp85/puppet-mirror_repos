#class to install packages
class mirror_repos::install {
  ensure_packages(
    $mirror_repos::packages,
    {
      ensure => present,
    },
  )
}
