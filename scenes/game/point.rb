# coding: utf-8

class Point
  attr_accessor :x, :y

  def initialize(x, y, route_no, opt = {})
    @x = x
    @y = y
    @img_flag = opt[:image] || true
    @event = opt[:event]
		if @event
		  @event.point = self
		end
		
		case route_no
		when 0
			point_img = "./color/bpoint.png"
		when 1
			point_img = "./color/gpoint.png"
		when 2
			point_img = "./color/point.png"
		when 3
			point_img = "./color/rpoint.png"
		when 4
			point_img = "./color/ypoint.png"
		else
			return
		end
		
    img_file = File.join(File.dirname(__FILE__), "..", "..", "images", point_img)
    @point_img = Image.load(img_file)
  end

  def event(player)
    return false unless @event
    player.items[@event.item_no] += 1
  end

  def draw
    Window.draw(@x, @y, @point_img) if @img_flag
		if @event
		  @event.draw(@x, @y)
		end
  end
end
