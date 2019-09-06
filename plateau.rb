
class Plateau
  attr_accessor :rovers, :max_x, :max_y
  def initialize(max_x, max_y)
    @max_x = max_x
    @max_y = max_y
    @rovers = []
  end

  def print_info
    puts "plateau created with x(#{@max_x}) and y(#{@max_y})"
  end

  def add_rover_location(rover)
    @rovers.push(rover)
    rover.plateau = self
  end

  def check_for_rovers(current_x, current_y)
    @rovers.each do |rover|
      if rover.x.to_i == current_x && rover.y.to_i == current_y
        false
      else
        true
      end
    end
  end

end
