# coding: utf-8

require_relative 'point'
require_relative 'event'

class Map
  attr_reader :points

  def initialize
    map_file = File.join(File.dirname(__FILE__), "..", "..", "images", "map.png")
    @map_img = Image.load(map_file)
    @points = []
    @points << Point.new(68   , 100, event: Event.new)
    @points << Point.new(60   , 250, event: Event.new)
    @points << Point.new(210   , 350)
    @points << Point.new(166   , 400)
    @points << Point.new(300   , 500)
    @points << Point.new(450   , 490)
    @points << Point.new(535   , 390)
    @points << Point.new(628   , 310)
    @points << Point.new(610   , 210)
    @points << Point.new(584   , 150)
    @points << Point.new(650   , 85)
    @points << Point.new(760   , 25, image: false)
  end

  def get_point_pos(pos)
    return @points[pos].x, @points[pos].y
  end

  def draw
    Window.draw(0, 0, @map_img)
    @points.each do |point|
      point.draw
    end
  end
end