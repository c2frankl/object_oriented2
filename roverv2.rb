=begin 
State:

x coordinate
y coordinate
direction

Behaviour:
read instruction
move
turn
=end 



class Rover #Starting off w/ class
  attr_accessor :x, :y, :direction

  Compass = ['n', 'e', 's', 'w']

  def initialize(x, y, direction, width =10 , length =10)
    @x = x
    @y = y
    @direction = direction
    @width = width
    @length = length
  end

  def move #tried a few ways, from else statements to when.
    case @direction
    when "n"
      @y += 1
    when "s"
      @y -= 1
    when "e"
      @y += 1
    when "w"
      @y -= 1
    end
  end

  def turn(n = 1)
    pos = Compass.index(@direction)
    @direction = Compass.rotate(n)[pos]
  end

  def turn_right
    Compass.rotate(1)
  end

  def turn_left
    Compass.rotate(-1)
  end

  def read_instruction(i)
    case i
    when "m"
      move
    when "l"
      turn_left
    when "r"
      turn_right
    end

    puts self
  end

  def to_s
    "<Rover: #{x}, #{y} facing #{direction}>"
  end

# Including optional grid collision. 

  def collides?(other)
    x == other.x and y == other.y
  end

  def in_bounds?(x, y)
    x >= 0 and x <= @width and
    y >= 0 and y <= @height
  end

end

rovers = [Rover.new(1, 1, "n"), Rover.new(5, 1, "e")]

rovers.each do |r|
  input = "LMM"

  input.each_char do |c|
    r.read_instruction(c)
  end
end