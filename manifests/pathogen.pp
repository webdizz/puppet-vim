class vim:pathogen {
  repository { "${vim::vimdir}/bundle/vim-pathogen":
    source => 'tpope/vim-pathogen',
    require => File[$vim::vimdir]
  }
}
