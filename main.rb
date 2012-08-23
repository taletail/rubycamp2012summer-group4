# coding: utf-8

require 'dxruby'
require 'dxrubyex'
require_relative 'lib/scene'
require_relative 'lib/util'

Window.caption = "Board Game Sample"
Window.width   = 1000
Window.height  = 600

Scene.load_scenes

$orochi_hp = 100
$player = Player.new(nil)

Scene.set_scene(:battle)
#Scene.set_scene(:title)

Input.setRepeat(10,2)

class Item
	attr_accessor :power
	def initialize(no, name, power)
		@no = no
		@name = name
		@power = power
	end
end

ITEMS = [
	Item.new(0, "シジミ", 10),
	Item.new(1, "算盤", 50),
	Item.new(2, "出雲そば", 50),
	Item.new(3, "玉鋼", 50),
	Item.new(4, "飛び魚", 50),
	Item.new(5, "島根ワイン", 10)
]

$player = nil
$orochi_hp = nil

Window.loop do
  break if Input.keyPush?(K_ESCAPE)
  Scene.play
end
