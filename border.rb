class Border
  
  def initialize(x1, y1, x2, y2)
    @x1 = x1.to_f
    @y1 = y1.to_f
    @x2 = x2.to_f
    @y2 = y2.to_f
  end

  def intersection_west_of?(longitude, latitude)
    intersects?(latitude) && (x_intercept(latitude) < longitude)
  end
  
  def intersection_east_of?(longitude, latitude)
    intersects?(latitude) && (x_intercept(latitude) > longitude)
  end
  
  private
  
  def intersects?(y)
    x_intercept(y).between?([@x1, @x2].min, [@x1, @x2].max)
  end
  
  def x_intercept(y)
    (y - y_intercept) / slope
  end
  
  def y_intercept
    @y_intercept ||= @y1 - (slope * @x1)
  end
  
  def slope
    @slope ||= (@y1 - @y2) / (@x1 - @x2)
  end
end