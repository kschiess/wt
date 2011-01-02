require 'spec_helper'

describe Wt::Compiler do
  let(:compiler) { described_class.new() }
  let(:output) { compiler.compile(source) }
  subject { output }
  
  context "a simple addition" do
    let(:source) { '1 + 2'}
    
    it { should == '1 2 add'}
  end
end