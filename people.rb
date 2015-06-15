class Person # Person class
  attr_accessor :name
  def initialize(name)
    @name = name
  end
  def greeting
    puts "Hey coolio, my name is #{name}"
  end
end

class Student < Person
	def learn
    puts "I get it!"
  end
end

class Instructor < Person #received errors until fixed this.
  def teach
    puts "Everything in Ruby is an Object!"
  end
end

instructor = Instructor.new("Chris")
puts instructor.greeting

student = Student.new("Christina")
puts student.greeting

instructor.teach #Typo causde me a lot of grief here. 

student.learn

#student.teach => Will not work as this is an example of an instance method.
