# loan_calculator.rb
#
require 'yaml'
MESSAGES = YAML.load_file('loan_calculator_messages.yml')

loan_amount = 0.0
apr = 0.0
loan_duration_yrs = 0
monthly_rate = 0.0
loan_mths = 0
monthly_amount = 0.0
monthly_principal = 0.0
monthly_interest_payment = 0.0

def get_input(input_type)
  puts(">>$$$ " + input_type)
  if input_type == MESSAGES["loan_amount"] || input_type == MESSAGES["apr"]
    gets.chomp.to_f
  elsif input_type == MESSAGES["loan_duration_yrs"]
    gets.chomp.to_i
  end
end

def print_divider
  puts(MESSAGES["divider"])
end

def calculate_duration(loan_yrs)
  loan_yrs * 12
end

def calculate_payment(amount, annual_rate, loan_months)
  monthly_rate = (annual_rate / 100) / 12
  interest_pymt = amount * monthly_rate
  monthly_amount = amount * (monthly_rate / (1 - (1 + monthly_rate)**(-loan_months)))
  principal = monthly_amount - interest_pymt
  return monthly_rate, monthly_amount, principal, interest_pymt
end

def display_loan_info(duration, amount)
  # workaround for case where second decimal place is zero and does not display.
  puts(MESSAGES["amount"] + amount.to_s)
  puts(MESSAGES["loan_duration_mnths"] + duration.to_s)
end

def display_loan_pymt_info(rate, monthly_principal, monthly_int_pymnt)
  # workaround for case where second decimal place is zero and does not display.
  printable_principal = sprintf('%.2f', monthly_principal.round(2))
  puts(MESSAGES["monthly_interest"] + rate.round(4).to_s)
  puts(MESSAGES["monthly_principal"] + printable_principal)
  puts(MESSAGES["monthly_interest_pymt"] + monthly_int_pymnt.round(2).to_s)
end

puts(MESSAGES["welcome"])

loop do
  loop do
    loan_amount = get_input(MESSAGES["loan_amount"])
    if loan_amount == 0.0
      puts(MESSAGES["invalid"])
    else
      break
    end
  end
  loop do
    apr = get_input(MESSAGES["apr"])
    if apr == 0.0
      puts(MESSAGES["invalid"])
    else
      break
    end
  end
  loop do
    loan_duration_yrs = get_input(MESSAGES["loan_duration_yrs"])
    if loan_duration_yrs == 0
      puts(MESSAGES["invalid"])
    else
      break
    end
  end

  loan_mths = calculate_duration(loan_duration_yrs)
  monthly_rate, monthly_amount, monthly_principal, monthly_interest_payment =
    calculate_payment(loan_amount, apr, loan_mths)

  print_divider

  display_loan_info(loan_mths, loan_amount)

  print_divider

  display_loan_pymt_info(monthly_rate, monthly_principal, monthly_interest_payment)

  print_divider

  puts(MESSAGES["monthly_payment"] + monthly_amount.round(2).to_s)

  puts("Would you like to calculate another loan? Y or N?")
  if gets.chomp.downcase.start_with?('y')
    next
  else
    puts("Thank you for using the loan calculator.  Goodbye!")
    break
  end
end
