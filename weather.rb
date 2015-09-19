require 'yahoo_weatherman'

# Method to get user's location (zip code)
def get_location
	puts "Enter your zip code:"
	location = gets.chomp
end

# Method to get temperature by zip code
def get_weather(location)
	client = Weatherman::Client.new
	response = client.lookup_by_location(location)
	condition = response.condition['text']
	puts "The weather is #{condition.downcase}."
end

location = get_location
get_weather(location)
