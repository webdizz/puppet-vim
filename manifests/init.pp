class vim(
  $vimdir = "/Users/${::boxen_user}/.vim",
  $ensure = present,
  ) {
  package { 'vim':
    ensure => $ensure,
  }
}
