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
      @pairs[sorted_females[i]] = sorted_males[i]
      sorted_males[i].satisfaction = calc_satisfaction(sorted_males[i], sorted_females[i])
      sorted_females[i].satisfaction = calc_satisfaction(sorted_females[i], sorted_males[i])
    end
  end

  def calc_satisfaction player, teammate
    if teammate.proficiency >= player.desired_proficiency then
      return 0
    else
      return (teammate.proficiency - player.desired_proficiency).to_f/2
    end
  end

  def teams_to_s
    @pairs.each do |female, male|
      puts "(#{female.name}, #{male.name}) Satisfaction: #{female.satisfaction}"
      puts "(#{male.name}, #{female.name}) Satisfaction: #{male.satisfaction}"
    end
  end

  def each_curler
    @females.each do |person|
      yield person
    end

    @males.each do |person|
      yield person
    end
  end

  def first_ascent_hill_climb
    #@pairs = @pairs

    for i in 0..@males.size-2
      for j in i+1..@males.size-1
        old_fitness = calc_fitness

        temp = @males[i]
        @males[i] = @males[j]
        @males[j] = temp

        @males[i].satisfaction = calc_satisfaction(@males[i], @females[i])
        @females[i].satisfaction = calc_satisfaction(@females[i], @males[i])

        if(calc_fitness <= old_fitness) then
          temp = @males[i]
          @males[i] = @males[j]
          @males[j] = temp
          @males[i].satisfaction = calc_satisfaction(@males[i], @females[i])
          @females[i].satisfaction = calc_satisfaction(@females[i], @males[i])
        else
          puts 'teste'
        end
      end
    end
    puts calc_fitness
  end

  def calc_fitness
    ret = 0
    each_curler do |person|
      ret += person.satisfaction
    end
    return ret
  end
end