# metaprogramming to the rescue!
#Расширили методы для стандартных типов!!

class Numeric
  #1 part
  @@currencies = {'dollar' => 1.000, 'yen' => 0.013, 'euro' => 1.292, 'rupee' => 0.019}
  
  def method_missing(method_id)
    singular_currency = method_id.to_s.gsub( /s$/, '')
    if @@currencies.has_key?(singular_currency)
      self * @@currencies[singular_currency]
    else
      super
    end
  end
  
  def in(currency)
    singular_currency = currency.to_s.gsub( /s$/, '')
    self / @@currencies[singular_currency]
  end
  
  #puts 10.rupee.in(:dollar)
end  

class String
  def palindrome?
    stringToCheck = self.gsub!(/(\W|\b)/, "").downcase
    stringToCheck == stringToCheck.reverse  
  end
  
  #puts "A man! NaMa".palindrome?
end

module Enumerable
  def palindrome?
    if self.respond_to?("to_a")
      self.to_a == self.to_a.reverse
    end
  end  
end
