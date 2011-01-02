
require 'parslet'

class Wt::Parser < Parslet::Parser
  root(:expression)
  rule(:expression)   { 
    assignment |
    aexpression }
    
  rule(:assignment)   { identifier >> s('=') >> expression.as(:exp) }
    
  rule(:aexpression)  { 
    mexpression.as(:left) >> c('+-', :op) >> expression.as(:right) |
    mexpression 
  }
  rule(:mexpression)  { 
    atom.as(:left) >> c('*/', :op) >> mexpression.as(:right) |
    atom }
  rule(:atom)         { integer | s('(') >> expression >> s(')') }
  
  rule(:identifier)   { 
    (match['a-z'] >> match['\w\d'].repeat).as(:ident) >> space? 
  }
  rule(:integer)      { c('0-9', :int) }
    
  rule(:space?)       { space.maybe }
  rule(:space)        { match['\\s'].repeat }
private
  # Defines a string followed by any number of spaces. 
  #
  def s(str)
    str(str) >> space? 
  end

  # Defines a set of characters followed by any number of spaces.
  #
  def c(chars, name=nil)
    if name
      match[chars].as(name) >> space?
    else
      match[chars] >> space?
    end
  end
end