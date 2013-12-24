class vim($vimdir = "/Users/${::boxen_user}/.vim") {

#  include vim::pathogen

  package { 'vim': }

  file { [$vimdir,
    "${vimdir}/bundle"]:
    ensure  => directory,
    recurse => true,
  }

}
