require 'spec_helper'
describe 'mirror_repos' do
  context 'with default values for all parameters' do
    it { should contain_class('mirror_repos') }
  end
end
