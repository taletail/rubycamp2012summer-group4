# coding: utf-8

class Dice
  IMAGE_BASE = File.join(File.dirname(__FILE__), "..", "..", "images")
  def initialize
    @x = 10
    @y = 10
    @images = []
    @images << Image.load(File.join(IMAGE_BASE, "dice1.png"))
    @images << Image.load(File.join(IMAGE_BASE, "dice2.png"))
    @images << Image.load(File.join(IMAGE_BASE, "dice3.png"))
    @images << Image.load(File.join(IMAGE_BASE, "dice4.png"))
    @images << Image.load(File.join(IMAGE_BASE, "dice5.png"))
    @images << Image.load(File.join(IMAGE_BASE, "dice6.png"))
    @current_num = 0.0
  end

  def current_num
    return @current_num.to_i + 1
  end

  def rotate
    @current_num += 0.3
    @current_num = 0.0 if @current_num.to_i >= @images.size
  end

  def draw
    Window.draw(@x, @y, @images[@current_num.to_i])
  end
end