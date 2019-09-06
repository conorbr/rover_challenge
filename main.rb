require './plateau'
require './rover'

class Main
  def initialize
    create_plateau
    create_rovers
  end

  def create_plateau
    puts("please enter the dimensions of the plateau: (eg: 10 5)")
    dimensions = gets.chomp()
    coordinate_x, coordinate_y = dimensions.split(" ")
    @plateau = Plateau.new(coordinate_x, coordinate_y)
  end

  def create_rovers
    rover1 = Rover.new(1,2,'N')
    rover2 = Rover.new(3,3,'E')
    rover3 = Rover.new(4,3,'E')
    rover4 = Rover.new(1,3,'E')

    @plateau.add_rover_location(rover1)
    @plateau.add_rover_location(rover2)
    @plateau.add_rover_location(rover3)
    @plateau.add_rover_location(rover4)

    rover1.set_moves('LMLMLMLMM')
    rover2.set_moves('MMRMMRMRRM')
    rover3.set_moves('MMRMMLMLML')
    rover4.set_moves('MMMLMLMRRM')
  end

  # I thought it would be cool to create a loop to allow you to add as many rovers as you
  # would like, and loop through each rover setting them up as above. The internet community however
  # recommended against using dynamic variables so I reverted to having them hard coded in

end

Main.new()
