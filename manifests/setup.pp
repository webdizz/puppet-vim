class vim::setup {
  file { ["/Users/${::boxen_user}/.vim/autoload",
    "/Users/${::boxen_user}/.vim/bundle",
    ensure  => directory,
    recurse => true,
  }

  repository { "/Users/${::boxen_user}/.vim/vim-pathogen":
    source => 'tpope/vim-pathogen'
  }

  file { "/Users/${::boxen_user}/.vim/autoload/pathogen.vim":
    target  => "/Users/${::boxen_user}/.vim/vim-pathogen/autoload/pathogen.vim",
    require => [
      File["/Users/${::boxen_user}/.vim/autoload"],
      File["/Users/${::boxen_user}/.vim/bundle"],
      Repository["/Users/${::boxen_user}/.vim/vim-pathogen"]
    ]
  }
}
