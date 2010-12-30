
require 'parslet'

class Wt::Parser < Parslet::Parser
  rule(:expression) { mexpression >> (c('+-') >> expression).maybe }
  rule(:mexpression) { atom >> (c('*/') >> mexpression).maybe }
  rule(:atom) { integer | s('(') >> expression >> s(')') }
  
  rule(:integer) { c('0-9') }
    
  rule(:space?) { space.maybe }
  rule(:space)  { match['\\s'].repeat }
private
  # Defines a string followed by any number of spaces. 
  #
  def s(str)
    str(str) >> space? 
  end

  # Defines a set of characters followed by any number of spaces.
  #
  def c(chars)
    match[chars] >> space?
  end
end