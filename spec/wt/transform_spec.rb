require 'spec_helper'

describe Wt::Transform do
  include Wt::AST
  
  let(:transform) { described_class.new }
  subject { transform.apply(tree) }
  
  describe "integer literals (int: '1')" do
    let(:tree) { {int: '1'} }
    
    it { should == IntLit.new(1) }
  end
  describe "arithmetic expressions (left: ..., op: ..., right: ...)" do
    let(:tree) { {left: 'l', op: '+', right: 'r'} }
    
    it { should == Expression.new('l', '+', 'r') }
  end
  describe "assignments (ident: 'a', exp: ...)" do
    let(:tree) { {ident: 'a', exp: 'e'} }

    it { should == Assign.new('a', 'e') }
  end
end