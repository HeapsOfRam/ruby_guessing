$high = 0
$low = 0

def play_round(guesses)
	num = Random.new.rand($low..$high)

	for guess_step in 1..guesses
		puts "Enter a guess: "
		user_guess = gets.to_i

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

def determine_if_player_will_continue
	puts "Enter yes/y/1 to continue"
	user_choice = gets.chomp
	return user_choice == 'y' || user_choice == 'yes' || user_choice == '1'
end

puts ""
puts ">" * 10
puts "Welcome to the High Low Guessing Game!"
puts "The computer will choose a random number between the bounds you specify"
puts "You can enter how many guesses you want"
puts "You will be told whether your guess is too high or too low"
puts ""

continue_playing = true

while continue_playing
	puts "Please enter a lower bound: "
	$low = gets.to_i
	puts "Please enter an upper bound: "
	$high = gets.to_i
	puts "Please enter number of guesses you want to take: "
	guesses = gets.to_i

	if play_round(guesses)
		puts "You got the number"
	else
		puts "Better luck next time"
	end

	continue_playing = determine_if_player_will_continue()
end

puts "Thanks for playing!"
puts "Exiting..."
puts "<" * 10
puts ""
