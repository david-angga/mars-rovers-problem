require_relative 'robot'

describe Robot do
  it "should initiate with the given params x y" do
    robot = Robot.new(5,5)
    robot.max_x.should eq(5)
    robot.max_y.should eq(5)
  end
  
  it "should deploy to the given co-ordinates" do
    robot = Robot.new(5,5)
    robot.deploy(1,2,'N')
    robot.current_x.should eq(1)
    robot.current_y.should eq(2)
    robot.current_car.should eq('N') 
  end
  
  it "should move to follow the given command" do
    robot = Robot.new(5,5)
    
    robot.deploy(1,2,'N')
    robot.move(%w{L M L M L M L M M}).should eq('1 3 N')
    
    robot.deploy(3,3,'E')
    robot.move(%w{M M R M M R M R R M}).should eq('5 1 E')
  end
end
