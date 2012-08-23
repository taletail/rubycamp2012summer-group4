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
	Item.new(0, "シジミ", 10, "shizimi.png"),
	Item.new(1, "算盤", 50, "soroban.png"),
	Item.new(2, "出雲そば", 50,"soumen.png"),
	Item.new(3, "玉鋼", 50,"nihonto.png"),
	Item.new(4, "飛び魚", 50,"tobiuo.png"),
	Item.new(5, "島根ワイン", 10,"wine.png")
]
