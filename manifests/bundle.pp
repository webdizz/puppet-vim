define vim::bundle($source, $home_dir = false) {

  repository { "/Users/${::boxen_user}/.vim/bundle/${name}":
    source  => $source,
  }
}
