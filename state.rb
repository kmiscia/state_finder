require 'json'
require_relative 'border'

class State
  
  attr_accessor :name
  
  def initialize(name, coordinates)
    @name = name
    @coordinates = coordinates
  end
  
  # Ray Casting Algorithm - https://en.wikipedia.org/wiki/Point_in_polygon
  def contains?(longitude, latitude)
    vertex?(longitude, latitude) ||
    western_intersections(longitude, latitude).odd? ||
    eastern_intersections(longitude, latitude).odd?
  end
  
  private

  def borders
    @coordinates.each_cons(2).collect do |coordinate|
      Border.new(coordinate[0][0], coordinate[0][1], coordinate[1][0], coordinate[1][1])
    end
  end
  
  def vertex?(longitude, latitude)
    @coordinates.any? do |coordinates|
      coordinates[0] == longitude && coordinates[1] == latitude
    end
  end
  
  def western_intersections(longitude, latitude)
    borders.count do |border|
      border.intersection_west_of?(longitude, latitude)
    end
  end
  
  def eastern_intersections(longitude, latitude)
    borders.count do |border|
      border.intersection_east_of?(longitude, latitude)
    end
  end
end
