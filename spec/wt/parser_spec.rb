require 'spec_helper'

require 'parslet/rig/rspec'

describe Wt::Parser do
  let(:parser) { described_class.new }
  
  context "simple arithmetic expressions" do
    subject { parser.expression }
    it { should parse("1+2").
      as(left: {int: '1'}, right: {int: '2'}, op: '+') }
    it { should parse("1-2").
      as(left: {int: '1'}, right: {int: '2'}, op: '-') }
    it { should parse("1 * 2").
      as(left: {int: '1'}, right: {int: '2'}, op: '*') }
    it { should parse("1 / 2").
      as(left: {int: '1'}, right: {int: '2'}, op: '/') }
    it { should parse('1*2 + 3') }
    it { should parse('1 * (1 + 3)') }
  end
  
  context "assignment" do
    subject { parser.expression }
    it { should parse('a = 1').
      as(ident: 'a', exp: {int: '1'}) }
  end
end