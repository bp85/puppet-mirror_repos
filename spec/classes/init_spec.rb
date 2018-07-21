require 'spec_helper'
describe 'mirror_repos' do
  context 'on RedHat7 or CentOS7' do
    let(:facts) do
      it { is_expected.to compile.with_all_deps }
      { osfamily: 'RedHat', operatingsystemmajrelease: '7' }
    end
  end

  context 'on RedHat6 or CentOS6' do
    let(:facts) do
      it { is_expected.to compile.with_all_deps }
      { osfamily: 'RedHat', operatingsystemmajrelease: '6' }
    end
  end

  context 'with default values for all parameters' do
    it { is_expected.to contain_class('mirror_repos') }
  end
end
