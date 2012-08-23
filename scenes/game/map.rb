# coding: utf-8

require_relative 'point'
require_relative 'event'

class Map
  attr_reader :points

  def initialize
    map_file = File.join(File.dirname(__FILE__), "..", "..", "images", "map.png")
    @map_img = Image.load(map_file)
    @points = []
		
		route0 = []
		route1 = []
		route2 = []
		route3 = []
		route4 = []
		
		route0 << Point.new(290   , 529   , 0   )
		route0 << Point.new(200   , 501	  , 0   )
		route0 << Point.new(122   , 467	  , 0   )
		route0 << Point.new(49    , 413	  , 0   )
		route0 << Point.new(89    , 323	  , 0   )
		route0 << Point.new(167   , 268	  , 0   )
		
		route1 << Point.new(335   , 478	  , 1   )
		route1 << Point.new(318   , 390	  , 1   )
		route1 << Point.new(329   , 288	  , 1   )
		route1 << Point.new(370   , 169	  , 1   )
		route1 << Point.new(412   , 95	  , 1   )
		
		route2 << Point.new(392   , 461	  , 2   )
		route2 << Point.new(409   , 392	  , 2   )
		route2 << Point.new(396   , 294	  , 2   )
		route2 << Point.new(348   , 229	  , 2   )
		route2 << Point.new(282   , 150	  , 2   )
		route2 << Point.new(193   , 106	  , 2   )
		route2 << Point.new(99    , 91	  , 2   )
		
		route3 << Point.new(439   , 477	  , 3   )
		route3 << Point.new(470   , 385	  , 3   )
		route3 << Point.new(505   , 308	  , 3   )
		route3 << Point.new(541   , 234	  , 3   )
		route3 << Point.new(581   , 164	  , 3   )
		route3 << Point.new(615   , 86	  , 3   )
		
		route4 << Point.new(457   , 546	  , 4   )
		route4 << Point.new(530   , 547	  , 4   )
		route4 << Point.new(602   , 533	  , 4   )
		route4 << Point.new(668   , 491	  , 4   )
		route4 << Point.new(723   , 436	  , 4   )
		route4 << Point.new(724   , 365	  , 4   )
		route4 << Point.new(656   , 341	  , 4   )
		
		points << route0
		points << route1
		points << route2
		points << route3
		points << route4
  end

  def get_point_pos(pos, route)
    return @points[route][pos].x, @points[route][pos].y
  end

  def draw
    Window.draw(0, 0, @map_img)
    @points.each do |point|
      point.each do |p|
				p.draw
			end
    end
  end
end