class Robot
  attr_accessor :max_x, 
                :max_y, 
                :current_x, 
                :current_y, 
                :current_car # N E S W
  
  def initialize(x,y)
    @max_x = x
    @max_y = y
  end
  
  def deploy(x,y,car)
    @current_x = x
    @current_y = y
    @current_car = car
  end
  
  def move(commands)
    commands.each do |command|
      walk(command)
    end
    
    "#{current_x} #{current_y} #{current_car}"
  end
  
  private
  
  def walk(operator)
    case operator
      when 'L'
        case @current_car
          when 'N'
            @current_car = 'W'
          when 'S'
            @current_car = 'E'
          when 'W'
            @current_car = 'S'
          when 'E'
            @current_car = 'N'
        end
      when 'R'
        case @current_car
          when 'N'
            @current_car = 'E'
          when 'S'
            @current_car = 'W'
          when 'W'
            @current_car = 'N'
          when 'E'
            @current_car = 'S'
        end
      when 'M'
        case @current_car
          when 'N'
            @current_y += 1 unless @current_y >= @max_y
          when 'S'
            @current_y -= 1 unless @current_y <= 0
          when 'W'
            @current_x -= 1 unless @current_x <= 0
          when 'E'
            @current_x += 1 unless @current_x >= @max_x
        end
    end
  end
end
