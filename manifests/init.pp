# Installs vim and vundle

class vim($vimdir = "/Users/${::boxen_user}/.vim") {

  package { 'vim': }

  file { [$vimdir,
    "${vimdir}/bundle"]:
    ensure  => directory,
    recurse => true,
  }

  repository { "${vimdir}/bundle/vundle":
    source  => 'gmarik/vundle',
    require => File["${vimdir}/bundle"]
  }
}
