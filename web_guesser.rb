require 'sinatra'
require 'sinatra/reloader'

SECRET_NUMBER = rand(101)

get '/' do
	guess = params["guess"]
  	message = check_guess(guess.to_i)
  	erb :index, :locals => {:number => SECRET_NUMBER, :message => message}
end

def check_guess(guess)
	text = ""

	case
	when (guess - SECRET_NUMBER) > 5
		text = "Way too high!"
		
	when (guess - SECRET_NUMBER) < -5
		text = "Way too low!"
		
	when guess > SECRET_NUMBER
		text = "Too high!"
		
	when guess < SECRET_NUMBER
		text = "Too low!"
		
	when guess == SECRET_NUMBER
		text = "Correct!"
	end

	return text
end
