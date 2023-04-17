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

end
