require 'sinatra'
require 'sinatra/reloader'

SECRET_NUMBER = rand(101)

get '/' do
	guess = params["guess"].to_i
	number = "SECRET"

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
		number = SECRET_NUMBER.to_s
	end

	erb :index, :locals => {:number => number, :text => text}
	#throw params. inspect
end