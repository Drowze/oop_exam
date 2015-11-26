require 'scanf'

class Curler
  attr_reader :name, :proficiency, :desired_proficiency
  attr_accessor :satisfaction

  def self.parse curler_string
    values = curler_string.scanf("%s %d %d")
    new(*values)
  end

  def initialize name, proficiency, desired_proficiency
    @name = name
    @proficiency = proficiency
    @desired_proficiency = desired_proficiency
  end
end

