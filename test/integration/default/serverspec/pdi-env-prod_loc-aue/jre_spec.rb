require 'spec_helper'

describe package('jre1.8.0_144-1.8.0_144-fcs.x86_64') do
  it { should be_installed }
end
