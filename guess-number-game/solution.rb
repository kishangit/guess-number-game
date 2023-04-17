require 'pry'
class GuessNumber

  ## Initialize with random number
  def initialize(secret = rand(1000..9999).to_s)
    @secret = secret
    @num_guesses = 0
  end

end