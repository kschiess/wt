
# The entry point and main controller. 
#
class Wt::Compiler
  
  def parser; Wt::Parser.new; end
  def transformer; Wt::Transform.new; end
  
  # Compiles source and returns compilation result.
  #
  def compile(source)
    ast = transformer.apply(parser.parse(source))
    ast.compile
  end 
end