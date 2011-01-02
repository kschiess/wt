require 'spec_helper'

describe Wt::Transform do
  let(:transform) { described_class.new }
  subject { transform.apply(tree) }
  
  describe "integer literals (int: '1')" do
    let(:tree) { {int: '1'} }
    
    it { should == Wt::AST::IntLit.new(1) }
  end
end