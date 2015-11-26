require_relative './curler.rb'

class Agency
  attr_reader :males, :females, :pairs

  def initialize men, women
    @males = Array.new
    @females = Array.new

    file_males = File.open(men)
    file_females = File.open(women)

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

  def create_teams
    @pairs = Hash.new
    sorted_males = Array.new
    sorted_females = Array.new

    sorted_males = @males.sort { |a,b| b.proficiency <=> a.proficiency}
    sorted_females = @females.sort { |a,b| b.proficiency <=> a.proficiency}
    
    for i in 0..sorted_females.size-1
      @pairs[sorted_females[i], sorted_males[i]] = nil

      #if sorted_males[i].proficiency >= sorted_females[i].desired_proficiency and sorted_females[i].proficiency >= sorted_males[i].desired_proficiency then

    end
  end

  def calc_satisfaction
  end

  def teams_to_s
    @males.each do |person|
  end
end