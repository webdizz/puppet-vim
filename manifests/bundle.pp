define vim::bundle($source, $home_dir = undef) {
  if $home_dir == undef {
    $home = "/Users/${::boxen_user}"
  } else {
    $home = $home_dir
  }

  file { ["${home}/.vim/autoload",
    "/Users/${home}/.vim/bundle"]:
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

  repository { "${home_dir}/.vim/bundle/${name}":
    source  => $source,
    require => File["${home_dir}/.vim/autoload/pathogen.vim"]
  }
}
