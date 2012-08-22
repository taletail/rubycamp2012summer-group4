# coding: cp932

class Event
  attr_accessor :point
	
  def initialize(item_no)
	  @item_no = item_no
  end

  def exec
    puts "Event occurred."
  end
	
	def draw
	  # item no hyouji
	end
end