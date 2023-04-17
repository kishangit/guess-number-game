require 'pry'
class GuessNumber

  ## Initialize with random number
  def initialize(secret = rand(1000..9999).to_s)
    @secret = secret
    @num_guesses = 0
  end

  ##
  # Start playing the game => This method will take input from user and do all the checkings of number
  ##
  def play
    loop do
      # Prompt the user to guess the number
      puts "Guess the 4-digit number (#{100 - @num_guesses} guesses remaining):"

      # Take input from user
      user_guess = take_user_input

      ## Check total numbers present irrespective of position
      matches = check_how_many_number_are_present(user_guess)

      ## Check right number with right position
      correct_positions = check_right_number_with_position(user_guess)

      # Increment the number of guesses
      @num_guesses += 1

      # Check if the user guessed correctly
      if user_guess == @secret
        puts "4 0"
        puts "Congratulations, you guessed the secret number in #{@num_guesses} guesses!"
        break
      end

      # Check if the user has reached the maximum number of guesses
      if @num_guesses == 100
        puts "Sorry, you have run out of guesses. The secret number was #{@secret}."
        break
      end

      # Print the number of matches and correct positions
      puts "#{correct_positions} #{matches}"
    end
  end

  ##
  # This method will take input from the user
  ##
  def take_user_input
    # Read in the user's guess
    user_guess = gets.chomp
  end

  ##
  # This method will check how many numbers are present irrespective of position
  ##
  def check_how_many_number_are_present(user_guess)
    user_guess.scan(/[#{@secret}]/)
  end

  ##
  # This method will check how many numbers are present with the right position
  ##
  def check_right_number_with_position(user_guess)
    # Determine how many of the matches are in the correct position
    correct_positions = 0
    (0..3).each do |i|
      if @secret[i] == user_guess[i]
        correct_positions += 1
      end
    end
    correct_positions
  end

end
