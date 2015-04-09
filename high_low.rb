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
