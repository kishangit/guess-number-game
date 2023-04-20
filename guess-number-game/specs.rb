#ruby 2.7.6
require_relative "./solution.rb"
require 'rspec'

RSpec.describe GuessNumber do

  describe '#change_name' do

    it 'will test that secret number and number guesses are correctly initialized' do
      guess_number = GuessNumber.new('1234')
      expect(guess_number.instance_variable_get(:@secret)).to eq('1234')
      expect(guess_number.instance_variable_get(:@num_guesses)).to eq(0)
    end

    it 'will test that take_user_input method is taking the input from user correctly' do
      guess_number = GuessNumber.new
      allow(guess_number).to receive(:gets).and_return('1234')
      user_guess = guess_number.take_user_input
      expect(user_guess).to eq('1234')
    end

    it 'will test that check_how_many_number_are_present method counts the correct matches from input' do
      guess_number = GuessNumber.new('1234')
      matches = guess_number.check_how_many_number_are_present('1357')
      expect(matches.length).to eq(2)
    end
  end

  it 'will test that check_right_number_with_position method counts the correct number with right position' do
    guess_number = GuessNumber.new('1234')
    correct_positions = guess_number.check_right_number_with_position('1534')
    expect(correct_positions).to eq(3)
  end

  it 'will test that right guess on the first attempt will ensure that game is won' do
    guess_number = GuessNumber.new('1234')
    allow(guess_number).to receive(:gets).and_return('1234')
    expect { guess_number.play }.to output(
      "Guess the 4-digit number (100 guesses remaining):\n4 0\nCongratulations, you guessed the secret number in 1 guesses!\n"
    ).to_stdout
  end

  it 'will test that right guess on last attempt will ensure that game is won' do
    guess_number = GuessNumber.new('1234', 5)
    allow(guess_number).to receive(:gets).and_return(
      '5555', '5555', '5555', '5555', '1234'
    )
    expect { guess_number.play }.to output(
      "Guess the 4-digit number (5 guesses remaining):\n0 0\nGuess the 4-digit number (4 guesses remaining):\n0 0\nGuess the 4-digit number (3 guesses remaining):\n0 0\nGuess the 4-digit number (2 guesses remaining):\n0 0\nGuess the 4-digit number (1 guesses remaining):\n4 0\nCongratulations, you guessed the secret number in 5 guesses!\n"
    ).to_stdout
  end

  it 'will test that all wrong guess will ensure that game is lost' do
    guess_number = GuessNumber.new('1234', 5)
    allow(guess_number).to receive(:gets).and_return(
      '5555', '5555', '5555', '5555', '5555'
    )
    expect { guess_number.play }.to output(
      "Guess the 4-digit number (5 guesses remaining):\n0 0\nGuess the 4-digit number (4 guesses remaining):\n0 0\nGuess the 4-digit number (3 guesses remaining):\n0 0\nGuess the 4-digit number (2 guesses remaining):\n0 0\nGuess the 4-digit number (1 guesses remaining):\nSorry, you have run out of guesses. The secret number was 1234.\n"
    ).to_stdout
  end

  it 'will test that all wrong guess will ensure that game is lost' do
    guess_number = GuessNumber.new('1234', 2)
    allow(guess_number).to receive(:gets).and_return(
      'abc', '12312434235', '5555', '5555'
    )
    expect { guess_number.play }.to output(
      "Guess the 4-digit number (2 guesses remaining):\nPlease enter valid 4 digit number\nPlease enter valid 4 digit number\n0 0\nGuess the 4-digit number (1 guesses remaining):\nSorry, you have run out of guesses. The secret number was 1234.\n"
    ).to_stdout
  end
end
