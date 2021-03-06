require 'spec_helper'
describe 'mirror_repos' do
  let(:title) { 'mirror_repos' }

  on_supported_os.each do |os, facts|
    context "with default values for all parameters on #{os}" do
      let(:facts) do
        facts
      end

      it { is_expected.to compile }
    end
  end
end
