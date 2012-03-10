class MegaGreeter
  attr_accessor :names
  
  def initialize(names = "World")
    @names = names
  end
  
  #проверка на пустое, на одиночное, на итератор
  def say_hi
    if @names.nil? #так можно писать условия
      puts "..."
    elsif @names.respond_to?("each") #значит что в итераторе доступен метод each ==> итератор
      @names.each do |x_name| #так пробегаем по итератору
        puts "Hello #{x_name}!"
      end
    else 
      puts "Hallo #{@names}"    
    end
  end
  
  def say_bye
    if @names.nil?
      puts "..."
    elsif @names.respond_to?("join")
      # Join the list elements with commas
      puts "Bye #{@names.join(" || ")}" 
    else
      puts "Bye #{@names}"     
    end
  end
end

if __FILE__ == $0
  mg = MegaGreeter.new
  mg.say_hi; mg.say_bye
  
  mg.names="OnlyOneName"
  mg.say_hi; mg.say_bye
  
  mg.names=["Albert", "Brenda", "Charles", "Dave", "Englebert"]
  mg.say_hi; mg.say_bye
  
  mg.names=nil
  mg.say_hi; mg.say_bye
end