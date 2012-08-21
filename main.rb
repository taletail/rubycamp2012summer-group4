# coding: utf-8

require 'dxruby'
require 'dxrubyex'
require_relative 'lib/scene'
require_relative 'lib/util'

Window.caption = "Board Game Sample"
Window.width   = 800
Window.height  = 600

Scene.load_scenes

Scene.set_scene(:title)

Input.setRepeat(10,2)

Window.loop do
  break if Input.keyPush?(K_ESCAPE)
  Scene.play
end
