require 'spec_helper'

describe 'vim' do
  it do
    should contain_package('vim')
    should include_class('vim::setup')
  end
end

