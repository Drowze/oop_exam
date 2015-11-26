require 'scanf'

class Curler
  attr_reader :name, :proficiency, :desired_proficiency

  def self.parse curler_string
    values = country_string.scanf("%s %d %d")
    new(*values)
  end

  def initialize name, proficiency, desired_proficiency
    @name = name
    @proficiency = proficiency
    @desired_proficiency = desired_proficiency
  end
end

