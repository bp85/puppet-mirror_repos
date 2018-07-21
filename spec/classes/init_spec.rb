require 'spec_helper'
describe 'mirror_repos' do
  context 'with default values for all parameters' do
    let(:title) { 'mirror_repos' }
    it { is_expected.to compile }
    it { is_expected.to compile.with_all_deps }
    let(:facts) { { osfamily: 'RedHat', operatingsystemmajrelease: '6' } }
    let(:facts) { { osfamily: 'RedHat', operatingsystemmajrelease: '7' } }
  end
end
