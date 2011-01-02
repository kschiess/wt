
# AST nodes
module Wt::AST
  class IntLit < Struct.new(:int)
  end
  
  class Expression < Struct.new(:left, :op, :right)
  end
  
  class Assign < Struct.new(:ident, :exp)
  end
end