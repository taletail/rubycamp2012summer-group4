# coding: utf-8

class Point
  attr_accessor :x, :y

  def initialize(x, y, opt = {})
    @x = x
    @y = y
    @img_flag = opt[:image] || true
    @event = opt[:event]
		if @event
		  @event.point = self
		end
    img_file = File.join(File.dirname(__FILE__), "..", "..", "images", "point.png")
    @point_img = Image.load(img_file)
  end

  def event
    return false unless @event
    @event.exec
  end

  def draw
    Window.draw(@x, @y, @point_img) if @img_flag
		if @event
		  @event.draw
		end
  end
end
