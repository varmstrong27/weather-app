require 'yahoo_weatherman'

# Method to get user's location (zip code)
def get_location
	puts "Enter your zip code:"
	location = gets.chomp
end

# Method to get weather forecast
def get_forecast(location)
	client = Weatherman::Client.new
	weather = client.lookup_by_location(location)
	today = Time.now.strftime('%w').to_i
	puts "Weather forecast:\n"
	weather.forecasts.each do |info|
		weekday = info['date'].strftime('%w').to_i
		
		if weekday == today
			day = "Today"
		elsif weekday == today + 1
			day = "Tomorrow"
		else
			day = info['date'].strftime('%A')
		end

	 	puts day + " is going to be " + info['text'].downcase + " with a low of " + info['low'].to_s + " and a high of " + info['high'].to_s + " degrees Celsius."
	end
end

location = get_location
get_forecast(location)
