require_relative './curler.rb'

class Agency
  attr_reader :males, :females

  def initialize
    @males = Array.new
    @females = Array.new

    file_males = File.open('men_curlers.txt')
    file_females = File.open('women_curlers.txt')

    file_males.each do |line|
      @males << Curler.parse(line)
    end

    file_females.each do |line|
      @females << Curler.parse(line)
    end
  end

  def status
    puts 'MALE CURLERS:'
    @males.each { |person| puts "#{person.name}'s proficiency is #{person.proficiency}. Seeks partner with proficiency >= #{person.desired_proficiency}."}
    puts 'FEMALE CURLERS:'
    @females.each { |person| puts "#{person.name}'s proficiency is #{person.proficiency}. Seeks partner with proficiency >= #{person.desired_proficiency}."}
  end
end

obj = Agency.new
obj.status