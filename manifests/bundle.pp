define vim::bundle($source, $home_dir = false) {
  if $home_dir == false {
    $home = "/Users/${::boxen_user}"
  } else {
    $home = $home_dir
  }

  file { ["${home}/.vim/autoload",
    "${home}/.vim/bundle"]:
    ensure => directory,
  }

  repository { "${home}/.vim/vim-pathogen":
    source => 'tpope/vim-pathogen'
  }

  file { "${home}/.vim/autoload/pathogen.vim":
    target  => "${home}/.vim/vim-pathogen/autoload/pathogen.vim",
    require => [
      File["${home}/.vim/autoload"],
      File["${home}/.vim/bundle"],
      Repository["${home}/.vim/vim-pathogen"]
    ]
  }

  repository { "${home}/.vim/bundle/${name}":
    source  => $source,
    require => File["${home}/.vim/autoload/pathogen.vim"]
  }
}
