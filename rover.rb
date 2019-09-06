require './plateau'

class Rover
  attr_accessor :plateau, :x, :y, :direction
  def initialize(coordinate_x, coordinate_y, direction)
    @x = coordinate_x
    @y = coordinate_y
    @direction = direction.upcase()
    # new_rover
  end

  def new_rover
    puts("beep boop I am a rover and my x is: #{@x} my y is: #{@x} and my direction is: #{@direction}")
  end

  def set_moves(moves)
    moves.upcase().split("").each do |move|
      case move
      when 'L'
        rotate_left
      when 'R'
        rotate_right
      when 'M'
        if safe_move?
          move_rover
        else
          unsafe_message
          break
        end
      else
        unrecognized_input
    end
  end
    print_location
  end

  def print_location_info
    plateau.print_info
  end

  def safe_move?
    plateau.check_for_rovers(@x, @y) && @x <= plateau.max_x.to_i && @y <= plateau.max_y.to_i ? true : false
  end

  def move_rover
    case @direction
    when 'N'
      @y += 1
    when 'W'
      @x -= 1
    when 'S'
      @y -= 1
    when 'E'
      @x += 1
    else
      heading_error
    end
  end

  def rotate_left
    case @direction
    when 'N'
      @direction = 'W'
    when 'W'
      @direction = 'S'
    when 'S'
      @direction = 'E'
    when 'E'
      @direction = 'N'
    else
      heading_error
    end
  end

  def rotate_right
    case @direction
    when 'N'
      @direction = 'E'
    when 'E'
      @direction = 'S'
    when 'S'
      @direction = 'W'
    when 'W'
      @direction = 'N'
    else
      heading_error
    end
  end

  def print_location
    puts("#{@x} #{@y}, #{@direction}")
  end

  def unsafe_message
    plateau.check_for_rovers(@x, @y) ? puts("THERE IS ALREADY A ROVER IN THIS TILE. STOPPING...") : puts("EDGE OF PLATEAU REACHED. STOPPING...")
  end

  def unrecognized_input
    puts "ERROR: UNRECOGNIZED COMMAND"
  end

  def heading_error
    puts('ERROR: UNRECOGNIZED HEADING PLESE USE N , S , E or W')
  end

end
