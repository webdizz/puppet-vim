define vim::bundle($source, $home_dir = undef) {
  if $home_dir == undef {
    $home_dir = "/Users/${::boxen_user}"
  }

  file { ["${home_dir}/.vim/autoload",
    "/Users/${home_dir}/.vim/bundle"]:
    ensure => directory,
  }

  repository { "${home_dir}/.vim/vim-pathogen":
    source => 'tpope/vim-pathogen'
  }

  file { "${home_dir}/.vim/autoload/pathogen.vim":
    target  => "${home_dir}/.vim/vim-pathogen/autoload/pathogen.vim",
    require => [
      File["${home_dir}/.vim/autoload"],
      File["${home_dir}/.vim/bundle"],
      Repository["${home_dir}/.vim/vim-pathogen"]
    ]
  }

  repository { "${home_dir}/.vim/bundle/${name}":
    source  => $source,
    require => File["${home_dir}/.vim/autoload/pathogen.vim"]
  }
}
