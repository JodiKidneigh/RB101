# calculator.rb
# ask the user for two numbers
# ask the user for the operation to perform
# perform the operation
# return the result
#

Kernel.puts("Welcome to the Calculator!")

Kernel.puts("Please enter a number:")
number1 = Kernel.gets().chomp()


Kernel.puts("Please enter another number:")
number2 = Kernel.gets().chomp()

Kernel.puts("Choose an operation: + - * /")
operation = Kernel.gets().chomp()

if operation == "+"
  answer = number1.to_i +  number2.to_i
elsif operation == "-"  
  answer = number1.to_i -  number2.to_i
elsif operation == "*"  
  answer = number1.to_i *  number2.to_i
elsif operation == "/"  
  answer = number1.to_f /  number2.to_f
else
  puts("Not a valid operation.")
end


Kernel.puts("#{number1} #{operation} #{number2} = #{answer}")




