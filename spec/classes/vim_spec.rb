require 'spec_helper'

# describe 'vim' do
#    let :facts do
#      { :boxen_user => 'jhaals' }
#    end
#    it do
#     should contain_repository("/Users/jhaals/.vim/vim-pathogen")
#
#     should contain_file("/Users/jhaals/.vim/bundle").with({
#       'ensure'  => 'directory',
#       'recurse' => true,
#     })
#     should contain_file("/Users/jhaals/.vim").with({
#       'ensure'    => 'directory',
#       'recurse'   => true,
#     })
#     end
# end
describe 'vim dependencies' do
  it do
    # should contain_package('vim').with({
    #   'require' => 'Package[mercurial]'
    # })
    should contain_package('mercurial').with({
      'require' => 'Package[docutils]'
    })
    should contain_package('docutils').with({
      'ensure'   => 'installed',
      'provider' => 'pip',
    })
  end
end

