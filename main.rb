require_relative './agency.rb'

mixed_doubles_curling = Agency.new('men_curlers.txt', 'women_curlers.txt')
mixed_doubles_curling.status
mixed_doubles_curling.create_teams
mixed_doubles_curling.teams_to_s

mixed_doubles_curling.each_curler do |person|
	puts person.name
end