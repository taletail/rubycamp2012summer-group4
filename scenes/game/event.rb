# coding: cp932

class Event
  attr_accessor :point
	attr_accessor :item_no
	attr_accessor :item
	
  def initialize(item_name)
	  @item = ITEMS.find { |i| i.name == item_name }
	  @item_no = @item.no
  end

	def get_item
    puts "Event occurred."
  end
	
	def draw(x, y)
		# item no hyouji
		Window.draw(x, y, @item.image)
	end
end