
class Wt::Transform < Parslet::Transform
  include Wt::AST
  
  rule(int: simple(:int)) { 
    IntLit.new(Integer(int)) }
  rule(left: simple(:left), op: simple(:op), right: simple(:right)) { 
    Expression.new(left, op, right) }
  rule(ident: simple(:ident), exp: simple(:exp)) {
    Assign.new(ident, exp) }
end