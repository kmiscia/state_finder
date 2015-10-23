require_relative 'state'

class Locator
  
  def self.find(longitude, latitude)
    found_states = states.select do |state|
      state.contains?(longitude.to_f, latitude.to_f)
    end
    found_states.map(&:name)
  end
  
  def self.states
    File.open('states.json').read.split("\n").collect do |line|
      json = JSON.parse(line)
      State.new(json['state'], json['border'])
    end
  end  
end