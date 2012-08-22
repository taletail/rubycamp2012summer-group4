# coding: utf-8

require_relative 'point'
require_relative 'event'

class Map
  attr_reader :points

  def initialize
    map_file = File.join(File.dirname(__FILE__), "..", "..", "images", "map.png")
    @map_img = Image.load(map_file)
    @points = []
		
		route1 = []
		route2 = []
		route3 = []
		route4 = []
		route5 = []
		
		route1 << Point.new(290   , 529)
		route1 << Point.new(200   , 501)
		route1 << Point.new(122   , 467)
		route1 << Point.new(49    , 413)
		route1 << Point.new(89    , 323)
		route1 << Point.new(167   , 268)
		
		route2 << Point.new(335   , 478)
		route2 << Point.new(318   , 390)
		route2 << Point.new(329   , 288)
		route2 << Point.new(370   , 169)
		route2 << Point.new(412   , 95)
		
		route3 << Point.new(392   , 461)
		route3 << Point.new(409   , 392)
		route3 << Point.new(396   , 294)
		route3 << Point.new(348   , 229)
		route3 << Point.new(282   , 150)
		route3 << Point.new(193   , 106)
		route3 << Point.new(99    , 91)
		
		route4 << Point.new(439   , 477)
		route4 << Point.new(470   , 385)
		route4 << Point.new(505   , 308)
		route4 << Point.new(541   , 234)
		route4 << Point.new(581   , 164)
		route4 << Point.new(615   , 86)
		
		route5 << Point.new(457   , 546)
		route5 << Point.new(530   , 547)
		route5 << Point.new(602   , 533)
		route5 << Point.new(668   , 491)
		route5 << Point.new(723   , 436)
		route5 << Point.new(724   , 365)
		route5 << Point.new(656   , 341)
		
		points << route1
		points << route2
		points << route3
		points << route4
		points << route5
  end

  def get_point_pos(pos)
    return @points[pos].x, @points[pos].y
  end

  def draw
    Window.draw(0, 0, @map_img)
    @points.each do |point|
      #point.draw
			point.each do |p|
				p.draw
			end
    end
  end
end