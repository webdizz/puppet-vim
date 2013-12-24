class vim::pathogen {

  repository { "${vim::vimdir}/bundle/vim-pathogen":
    source => 'tpope/vim-pathogen',
    require => File[$vim::vimdir]
  }

  file { [$vim::vimdir, "${vim::vimdir}/bundle"]:
    ensure  => directory,
    recurse => true,
  }

  define bundle() {
    $bundle = split($name, '/')
    repository { "${vim::vimdir}/bundle/${bundle[1]}":
      source  => $name,
      require => File["${vim::vimdir}/bundle"],
    }
  }

}
