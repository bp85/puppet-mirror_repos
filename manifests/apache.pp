#class to manage vhost
class mirror_repos::apache {
  if $mirror_repos::manage_vhost {
    include ::apache
    include ::apache::mod::proxy

    if $mirror_repos::vhosts == {} {
      apache::vhost { $::fqdn:
        port    => '80',
        docroot => $mirror_repos::repos_dir,
      }
    }
    else {
      create_resources('apache::vhost',$mirror_repos::vhosts)
    }
  }
}
