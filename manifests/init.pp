# Public: Install vim and vim-pathogen if you use bundles
#
# Examples
#
#   include vim
#   vim::bundle { 'syntastic':
#     source => 'scrooloose/syntastic',
#   }
# There's an optional home_dir parameter if you use a custom home directory.

class vim {
  package { 'vim': }
}
