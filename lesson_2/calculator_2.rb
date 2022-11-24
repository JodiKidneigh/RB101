# calculator.rb
# ask the user for two numbers
# ask the user for the operation to perform
# perform the operation
# return the result
#

def prompt(message)
  Kernel.puts("=> #{message}")
end

def valid_number?(number)
  number.to_i != 0
end

prompt("Welcome to the Calculator! Enter your name:")

name = ''

loop do 
  name = Kernel.gets().chomp()
  if name.empty?()
    prompt("Make sure to use a valid name.")
  else
    break
  end
end

number1 = ''

prompt("Hi #{name}!")


loop do

  loop do
    prompt("Please enter a number:")
    number1 = Kernel.gets().chomp()
    if valid_number?(number1)
      break
    else
      prompt("Not a valid number!")
    end
  end


  number2 = ''

  loop do
    prompt("Please enter another number:")
    number2 = Kernel.gets().chomp()
    if valid_number?(number2)
      break
    else
      prompt("Not a valid number!")
    end
  end

  operation = ''
  answer = 0
  operation_message = ''
  
  prompt("Choose an operation: + - * /")
  
  loop do  
    operation = Kernel.gets().chomp()
    
    answer = case operation
      when  "+"
        answer = number1.to_i +  number2.to_i
        operation_message = "Adding"
        break
      when  "-"  
        answer = number1.to_i -  number2.to_i
        operation_message = "Subtracting"
        break
      when  "*"  
        answer = number1.to_i *  number2.to_i
        operation_message = "Multiplying"
        break
      when  "/"  
        answer = number1.to_f /  number2.to_f
        operation_message = "Dividing"
        break
      else
        prompt("Must choose + - * /")
    
    end  
  end

  prompt("#{operation_message} the two numbers...")

  prompt("#{number1} #{operation} #{number2} = #{answer}")

  puts("_____________________________________________")
  puts("")


  prompt("Do you want to performa another calculation? (Y to calculate again)")
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
end

prompt("Thank you for using the calculator, Goodbye!")



