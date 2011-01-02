
class Wt::Transform < Parslet::Transform
  include Wt::AST
  rule(:int => simple(:int)) { IntLit.new(Integer(int)) }
end