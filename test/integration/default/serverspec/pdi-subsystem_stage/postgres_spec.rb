require 'spec_helper'

describe port(5432) do
  it { should be_listening }
end
