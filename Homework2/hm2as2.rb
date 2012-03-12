class CartesianProduct
  include Enumerable
  
  attr_accessor :left, :right
  
  def initialize (left, right)
    @left = left
    @right = right
  end
  
  def each
    @left.each { |left_element|
      @right.each { |right_element|
        yield [left_element, right_element]
      }
    } 
  end
  # your code here
end

c = CartesianProduct.new([:a,:b], [4,5])
c.each { |elt| puts elt.inspect }
# [:a, 4]
# [:a, 5]
# [:b, 4]
# [:b, 5]

c = CartesianProduct.new([:a,:b], [])
c.each { |elt| puts elt.inspect }
# (nothing printed since Cartesian product
# of anything with an empty collection is empty)