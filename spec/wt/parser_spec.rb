require 'spec_helper'

describe Wt::Parser do
  let(:parser) { described_class.new }
  
  RSpec::Matchers.define :parse do |exp|
    match do |parser|
      parser.parse(exp)
    end
  end
  
  context "simple arithmetic expressions" do
    subject { parser.expression }
    it { should parse("1+2") }
    it { should parse("1-2") }
    it { should parse("1*2") }
    it { should parse("1/2") }
    it { should parse('1*2 + 3') }
    it { should parse('1 * (1 + 3)') }
  end
end