define vim::bundle() {
  $bundle = split($name, '/')
  repository { "/Users/${::boxen_user}/.vim/bundle/${bundle[1]}":
    source  => $name,
  }
}
