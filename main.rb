require_relative './agency.rb'

mixed_doubles_curling = Agency.new('men_curlers.txt', 'women_curlers.txt')
mixed_doubles_curling.status

mixed_doubles_curling.create_teams
puts "\nSatisfaction of each player:"
mixed_doubles_curling.teams_to_s

puts "\nElite players:"
mixed_doubles_curling.each_curler do |person|
  if person.proficiency == 10
    puts person.name
  end
end

mixed_doubles_curling.calculate_fitness