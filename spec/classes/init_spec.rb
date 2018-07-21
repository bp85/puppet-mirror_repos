require 'spec_helper'
describe 'mirror_repos' do
  context 'with default values for all parameters' do
    it { is_expected.to contain_class('mirror_repos') }
    { osfamily: 'RedHat', operatingsystemmajrelease: '6' }
    { osfamily: 'RedHat', operatingsystemmajrelease: '7' }
  end
end
