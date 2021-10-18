class Animal
end

class Cat < Animal
  def talk(custom_msg = '')
    puts "Meow! #{custom_msg}"
  end
end

class Dog < Animal
  def talk
    puts "Woof!"
  end
end