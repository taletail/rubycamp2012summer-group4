# coding: utf-8
=begin
	@ageを追加(津田)
=end

class Player
	attr_accessor :age
	attr_accessor :items
	
  def initialize(map, x = 391, y = 541)
		@map = map
		@age = 0
		@items = []
		
    @x = x
    @y = y
    @pos = 0.0
		@route_no = nil
    img_file = File.join(File.dirname(__FILE__), "..", "..", "images", "player.png")
    @img = Image.load(img_file)
    @step = 0.1
  end

  def move(counter, route_no)
		@route_no = route_no
		
    @pos += @step
    @x, @y = @map.get_point_pos(@pos.to_i, @route_no)
		
    if @pos.to_i == @map.points[@route_no].size - 1
      Scene.set_scene(:ending)
    end
    return counter - @step.abs
  end

  def check_event
    @map.points[@route_no][@pos.to_i].event
  end

  def draw
    Window.draw(@x, @y, @img)
  end
end