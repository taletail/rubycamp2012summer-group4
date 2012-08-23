# coding: utf-8
=begin
	@ageを追加(津田)
=end

class Player
	attr_accessor :age
	attr_accessor :items
    attr_accessor :hp
	
  def initialize(map, x = 391, y = 541)
		@map = map
		@age = 0
		@items = []
		
    @x = x
    @y = y
    @pos = 0.0
		@route_no = nil
    img_file = File.join(File.dirname(__FILE__), "..", "..", "images", "men0.png")
    @img = Image.load(img_file)
    @step = 0.0625
    @hp = 100
  end

  def move(counter, route_no)
		@route_no = route_no 
    @x, @y = @map.get_point_pos(@pos.to_i, @route_no)
		@pos += @step
		
		if @pos.to_i >= @map.points[@route_no].size
			@x = 391
			@y = 541
			@pos = 0.0
      return counter - @step.abs, true
    end
    return counter - @step.abs, false
  end

  def check_event
    @map.points[@route_no][@pos.to_i].event
  end
	
	def img_change(age)
		case age
		when 10
			char_img = "men10.png"
		when 20
			char_img = "men20.png"
		when 40
			char_img = "men40.png"
		when 60
			char_img = "men60.png"
		when 80
			char_img = "men80.png"
		else
			return
		end
		img_file = File.join(File.dirname(__FILE__), "..", "..", "images", char_img)
    @img = Image.load(img_file)
	end
	
  def draw
    Window.draw(@x, @y, @img)
  end
end