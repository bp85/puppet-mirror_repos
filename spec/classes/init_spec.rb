require 'spec_helper'
describe 'mirror_repos' do
  let(:title) { 'mirror_repos' }

  on_supported_os.each do |os, facts|
    context "with default values for all parameters on #{os}" do
      let(:facts) do
        facts
      end

      it { is_expected.to contain_class('mirror_repos::apache') }
      it { is_expected.to contain_class('mirror_repos::params') }
      it { is_expected.to contain_class('mirror_repos::install') }
      it { is_expected.to contain_class('mirror_repos::config') }
      it { is_expected.to compile.with_all_deps }
    end
  end
end
