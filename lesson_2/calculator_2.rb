# calculator.rb
# ask the user for two numbers
# ask the user for the operation to perform
# perform the operation
# return the result
#
require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')
def prompt(message)
  Kernel.puts("=> #{message}")
end

def valid_number?(number)
  number.to_i.to_s == number
end

prompt(MESSAGES['welcome'])

name = ''

loop do
  name = Kernel.gets().chomp()
  if name.empty?()
    prompt(MESSAGES['valid_name'])
  else
    break
  end
end

number1 = ''

prompt("Hi #{name}!")

loop do
  loop do
    prompt(MESSAGES['number'])
    number1 = Kernel.gets().chomp()
    if valid_number?(number1)
      break
    else
      prompt(MESSAGES['not_valid'])
    end
  end

  number2 = ''

  loop do
    prompt(MESSAGES['number'])
    number2 = Kernel.gets().chomp()
    if valid_number?(number2)
      break
    else
      prompt(MESSAGES['not_valid'])
    end
  end

  operation = ''
  answer = 0
  operation_message = ''

  if number2.to_i == 0
    prompt(MESSAGES['zero'])
    prompt("Choose an operation: + - * ")
  else
    prompt("Choose an operation: = - * / ")
  end

  loop do
    operation = Kernel.gets().chomp()
    answer = case operation
             when  "+"
               answer = number1.to_i + number2.to_i
               operation_message = "Adding"
               break
             when  "-"
               answer = number1.to_i - number2.to_i
               operation_message = "Subtracting"
               break
             when  "*"
               answer = number1.to_i * number2.to_i
               operation_message = "Multiplying"
               break
             when  "/"
               if number2.to_f == 0
                 prompt(MESSAGES['zero']) 
                 break
               else
                 answer = number1.to_f / number2.to_f
                 operation_message = "Dividing"
                 break
               end
             else
               prompt("Must choose + - * /")
             end
  end
  if answer == nil
    puts("Invalid operation")
  else
    prompt("#{operation_message} the two numbers...")

    prompt("#{number1} #{operation} #{number2} = #{answer}")

    puts("_____________________________________________")
    puts("")
  end
    prompt(MESSAGES['again'])
    answer = Kernel.gets().chomp()
    break unless answer.downcase().start_with?('y')
end

prompt(MESSAGES['goodbye'])
