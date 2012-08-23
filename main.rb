# coding: cp932

require 'dxruby'
require 'dxrubyex'
require_relative 'lib/scene'
require_relative 'lib/util'
require_relative 'lib/item'

Window.caption = "Board Game Sample"
Window.width   = 1000
Window.height  = 600

Scene.load_scenes

$player = Player.new(nil)
$counter = 0

Scene.set_scene(:title)

Input.setRepeat(10,2)

Window.loop do
  break if Input.keyPush?(K_ESCAPE)
  Scene.play
end
