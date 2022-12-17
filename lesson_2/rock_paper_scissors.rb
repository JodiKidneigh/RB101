# r = rock, p = paper, sc = scissors, sp = Spock, l = lizard

VALID_CHOICES = %w(r p sc sp l)
WINNING_CHOICES = { 'r': ['sc', 'l'], 'p': ['r', 'sp'], 'sc': ['l', 'p'], 'l': ['sp', 'p'], 'sp': ['r', 'sc'] }
player_score = 0
computer_score = 0

def prompt(message)
  puts("=> #{message}")
end

def win?(first_player, second_player)
  moves = []
  WINNING_CHOICES.each do |k, v|
    if k == first_player.to_sym
      v.each do |v2|
        moves << v2
      end
    end
  end

  if moves.include?(second_player)
    true
  end
end

def check_scores(p_score, c_score)
  if p_score == 3
    "You"
  elsif c_score == 3
    "Computer"
  end
end

def display_results(wins, player, computer)
  puts("You chose: #{player}; Computer chose: #{computer}; #{wins} this round!")
end

def display_scores(play_score, comp_score)
  puts("Current Scores: Player #{play_score} Computer #{comp_score}")
end

player_choice = ''

loop do
  loop do
    prompt("Choose one (r = Rock, p = Paper, sc = Scissors, l = Lizard, sp = Spock):
           #{VALID_CHOICES.join(', ')}")
    player_choice = gets().chomp().downcase()

    if VALID_CHOICES.include?(player_choice)
      break
    else
      prompt("That's not a valid choice.")
    end
  end

  computer_choice = VALID_CHOICES.sample

  if win?(computer_choice, player_choice)
    computer_score += 1
    winner = 'Computer won'
  elsif win?(player_choice, computer_choice)
    player_score += 1
    winner = 'You won'
  elsif player_choice == computer_choice
    winner = "It's a draw"
  end

  display_results(winner, player_choice, computer_choice)
  display_scores(player_score, computer_score)
  grand_winner = check_scores(player_score, computer_score)

  if grand_winner
    puts("Game Over!  Grand Winner is: #{grand_winner}!")
    break
  end
  prompt("Do you want to play again?")
  answer = gets.chomp
  break unless answer.downcase.start_with? 'y'
end
