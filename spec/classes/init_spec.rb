require 'spec_helper'
describe 'links' do
  context 'with default values for all parameters' do
    it { should contain_class('links') }
  end
end
