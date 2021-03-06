def play_round(guesses, low, high)
	num = Random.new.rand(low..high)

	for guess_step in 1..guesses
		user_guess = ensure_user_guess_in_bounds(low, high)

		if user_guess == num
			return true
		elsif user_guess > num
			puts "Too High"
		elsif user_guess < num
			puts "Too Low"
		end
	end

	return false
end

def ensure_user_guess_in_bounds(low, high)
	begin
		puts "Please enter a guess between #{low} and #{high}"
		user_guess = gets.to_i
	end until user_guess < high && user_guess > low

	return user_guess
end

def determine_if_player_will_continue
	puts ""
	puts "Enter yes/y/1 to continue"
	user_choice = gets.chomp
	return user_choice == 'y' || user_choice == 'yes' || user_choice == '1'
end

def valid_high_low(low, high)
	return high > low && high - low >= 9
end

def ensure_valid_number_of_guesses
	begin
		puts "Please enter a number of guesses greater than 0"
		guesses = gets.to_i
	end until guesses > 0

	return guesses
end

puts ""
puts ">" * 10
puts "Welcome to the High Low Guessing Game!"
puts "The computer will choose a random number between the bounds you specify"
puts "You can enter how many guesses you want"
puts "You will be told whether your guess is too high or too low"

continue_playing = true

while continue_playing
	begin
		puts ""
		puts "Please enter lower bound and then upper bound"
		puts "Also, please make sure the bounds are at least 9 apart"
		puts "Please enter a lower bound: "
		low = gets.to_i
		puts "Please enter an upper bound: "
		high = gets.to_i
	end while not valid_high_low(low, high)

	guesses = ensure_valid_number_of_guesses()

	if play_round(guesses, low, high)
		puts "You got the number"
	else
		puts "Better luck next time"
	end

	continue_playing = determine_if_player_will_continue()

	high, low = 0, 0
end

puts "Thanks for playing!"
puts "Exiting..."
puts "<" * 10
puts ""
