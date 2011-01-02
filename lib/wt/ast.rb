
# AST nodes
module Wt::AST
  class IntLit < Struct.new(:int)
    def compile
      int
    end
  end
  
  class Expression < Struct.new(:left, :op, :right)
    OP_TABLE = {
      '+' => 'add'
    }
    
    def compile
      "#{left.compile} #{right.compile} #{OP_TABLE[op]}"
    end
  end
  
  class Assign < Struct.new(:ident, :exp)
  end
end