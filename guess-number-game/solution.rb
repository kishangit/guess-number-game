require 'pry'
class GuessNumber

  ## Initialize with random number
  def initialize(secret = rand(1000..9999).to_s)
    @secret = secret
    @num_guesses = 0
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

end
