VALID_CHOICES = ['rock', 'paper', 'scissors']
def prompt(message)
  puts("=> #{message}")
end

def win?(first_player, second_player)
  (first_player == 'rock' && second_player == 'scissors') ||
    (first_player == 'paper' && second_player == 'rock') ||
    (first_player == 'scissors' && second_player == 'paper')
end

def display_results(wins, player, computer)
  puts("You chose: #{player}; Computer chose: #{computer}; #{wins}")
end

player_choice = ''

loop do
  loop do
    prompt("Choose one: #{VALID_CHOICES.join(', ')}")
    player_choice = gets().chomp()

    if VALID_CHOICES.include?(player_choice)
      break
    else
      prompt("That's not a valid choice.")
    end
  end

  computer_choice = VALID_CHOICES.sample

  if win?(computer_choice, player_choice)
    winner = 'Computer won!'
  elsif win?(player_choice, computer_choice)
    winner = 'You won!'
  elsif player_choice == computer_choice
    winner = "It's a draw!"
  end

  display_results(winner, player_choice, computer_choice)

  prompt("Do you want to play again?")
  answer = gets.chomp
  break unless answer.downcase.start_with? 'y'
end
