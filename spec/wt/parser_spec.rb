require 'spec_helper'

describe Wt::Parser do
  let(:parser) { described_class.new }
  
  RSpec::Matchers.define :parse do |exp|
    match do |parser|
      begin
        parser.parse(exp)
        true
      rescue Parslet::ParseFailed
        false
      end
    end
    failure_message_for_should do |parser|
      begin
        parser.parse(exp)
      rescue Parslet::ParseFailed => b
        parser.error_tree.to_s
      end
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
  
  context "assignment" do
    subject { parser.expression }
    it { should parse('a = 1') }
  end
end