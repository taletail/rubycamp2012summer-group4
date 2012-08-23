# coding: cp932

class Item
	attr_accessor :power

	def initialize(no, name, power, image_name)
		@no = no
		@name = name
		@power = power
    path = File.join(File.dirname(__FILE__), "..", "..", "images", image_name)
		@image = Image.load(path)
	end
end

ITEMS = [
	Item.new(0, "�V�W�~", 10, "shizimi.png"),
	Item.new(1, "�Z��", 50, "soroban.png"),
	Item.new(2, "�o�_����", 50,"soumen.png"),
	Item.new(3, "�ʍ|", 50,"nihonto.png"),
	Item.new(4, "��ы�", 50,"tobiuo.png"),
	Item.new(5, "�������C��", 10,"wine.png")
]
