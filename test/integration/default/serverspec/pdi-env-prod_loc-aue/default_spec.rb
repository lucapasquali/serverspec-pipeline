require 'spec_helper'

describe file('/home/y') do
  it { should be_directory }
end
