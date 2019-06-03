require 'pry'

class Triangle
  attr_accessor :s1, :s2, :s3
  
  def initialize(s1, s2, s3)
    @s1 = s1
    @s2 = s2
    @s3 = s3
  end
  
  def kind
    if (s1+s2<=s3) || (s1+s3<=s2) || (s2+s3<=s1) || s1 <= 0 || s2 <= 0 || s3 <= 0 
      raise TriangleError
    elsif s1 == s2 && s1 == s3
      :equilateral
    elsif s1 == s2 || s1 == s3 || s2 == s3
      :isosceles
    else
      :scalene
    end
  end
  
  class TriangleError < StandardError
  end
end

# better way:
  # def kind
  #   validate_triangle
  #   if a == b && b == c
  #     :equilateral
  #   elsif a == b || b == c || a == c
  #     :isosceles
  #   else
  #     :scalene
  #   end
  # end

  # def validate_triangle
  #   real_triangle = [(a + b > c), (a + c > b), (b + c > a)]
  #   [a, b, c].each { |s| real_triangle << false if s <= 0 }
  #   raise TriangleError if real_triangle.include?(false)
  # end
