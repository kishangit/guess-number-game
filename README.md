# Number Guess Challenge

## Ruby >= 2.7.0


### 🤔 Approach
1. CLI application
2. Print output based on user input
3. No database calls
4. Things to calculate<br />
-> How many numbers are present and are at the right position<br />
-> How many numbers are present irrespective of position
5. Implementation<br />
-> One main execution file<br />
-> Take input from user<br />
-> Validate input from user<br />
-> Need to decide when game is won and when game is lost
6. Test cases<br />
-> RSpec for test cases

<br />

### 🪜 Steps to run the game:
1. Clone the repo.<br />
```
git clone https://github.com/kishangit/guess-number-game.git)
```
2. go to the code directory of repo<br />
```
cd guess-number-game
```
3. If you want to play the game then in `guess-number-game/solution.rb` add below lines at the end<br />
```
g = GuessNumber.new()
g.play
```
and then save it and run this command<br />
```
ruby guess-number-game/solution.rb
```
4. It will start the game and ask you to guess it. If the number you have entered has some similarities to the guessed number then it will print the output of same number and same position whicch you have guessed.
5. If you are able to guess the number correctly in 100 guesses then it will exit the code by saying 'Congratulatuions'.
6. If you are not able to guess the number correctly in 100 guesses then it will exit the code by saying 'Sorry you ran out of guesses'.

<br />

### Test cases
1. go to the code directory of repo<br />
```
cd guess-number-game
```
2. Remove or comment below lines(if you have added) from the end of the `guess-number-game/solution.rb` file.
```
g = GuessNumber.new()
g.play
```
3. run below command to run the test cases
```
rspec guess-number-game/specs.rb
```