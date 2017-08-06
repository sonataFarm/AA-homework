require 'byebug'
require 'colorize'
FLASH_TIME = 0.5
START_DELAY = 1
BETWEEN_ROUND_TIME = 1

class Simon
  COLORS = %w(red blue green yellow)
  COLOR_ABBREVIATIONS = COLORS.map { |color| [color[0], color] }.to_h
  SUCCESS_MESSAGES = [
    "You got it!",
    "Great work!",
    "That's it!",
    "Uh-huh!",
    "Keep it up!",
    "Great job.",
    "Wonderful!",
    "Fantastic!",
    "Amazing.",
    "Holy cow!"
  ]

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    start_message

    until game_over
      take_turn
    end

    game_over_message
    reset_game
  end

  def start_message
    puts "Let's play Simon!"
    sleep(START_DELAY)
  end

  def take_turn
    show_sequence

    guess = require_sequence
    validate_sequence(guess)
    return if game_over

    round_success_message
    @sequence_length += 1
  end

  def show_sequence
    add_random_color
    display_sequence
  end

  def require_sequence
    guess = prompt_for_sequence
    parse_guess(guess)
  end

  def parse_guess(guess)
    # guess is string of colors separated by spaces
    guess.split('').map { |guess| COLOR_ABBREVIATIONS[guess] }
  end

  def validate_sequence(guess)
    if guess == seq
      true
    else
      @game_over = true
      false
    end
  end

  def prompt_for_sequence
    print "Your turn! >> "
    gets.chomp
  end

  def add_random_color
    seq << COLORS.sample
  end

  def round_success_message
    puts SUCCESS_MESSAGES.sample
    sleep(BETWEEN_ROUND_TIME)
    system("clear")
  end

  def game_over_message
    puts "Game over :("
    sleep(BETWEEN_ROUND_TIME)
  end

  def display_sequence
    seq.each do |color|
      print "#{color.send(color)} "
      sleep(FLASH_TIME)
    end
    system("clear")
  end

  def reset_game
    @sequence_length = 1
    @game_over = false
    @seq = []
    play if play_again?
  end

  def play_again?
    print "Play again? y/n >>"
    if gets.chomp == 'y'
      true
    else
      false
    end
  end
end
