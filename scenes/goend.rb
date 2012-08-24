class Goend
  def initialize
    orochi_img = File.join(File.dirname(__FILE__),"..","images", "orochii01.png")
    orochi_sound = File.join(File.dirname(__FILE__),"..","sound", "win.wav")
    @orochi = Image.load(orochi_img)
    @bgm_switch = 0
    $bgm_go_end = Sound.new(orochi_sound)
    @alpha = 255
    @count = 0
    @x_alpha = 0
    @x = 200
    @y = -5
  end

  def play
    if @bgm_switch == 0
    $bgm_go_end.play
    @bgm_switch = 1
    end
    if @alpha == 0
      Scene.set_scene(:ending)
      $bgm_go_end.stop
    end
    @alpha -= 1
    if @count <= 5 || (@count > 10 && @count <= 20) || (@count > 30 && @count <= 40) || (@count > 50 && @count <= 60) || (@count > 70 && @count <= 80) || (@count > 90 && @count <= 100) || (@count > 110 && @count <= 120) || (@count > 130 && @count <= 140) || (@count > 150 && @count <= 160) || (@count > 170 && @count <= 180) || (@count > 190 && @count <= 200) || (@count > 210 && @count <= 220) || (@count > 230 && @count <= 240) || (@count > 250 && @count <= 255)
      @x_alpha += 2
    elsif (@count > 5 && @count <= 10) || (@count > 20 && @count <= 30) || (@count > 40 && @count <= 50) || (@count > 60 && @count <= 70) || (@count > 80 && @count <= 90) || (@count > 100 && @count <= 110) || (@count > 120 && @count <= 130) || (@count > 140 && @count <= 150) || (@count > 160 && @count <= 170) || (@count >180 && @count <= 190) || (@count >200 && @count <= 210) || (@count >220 && @count <= 230) || (@count >240 && @count <= 250)
      @x_alpha -= 2
    end
  @x = 200 + @x_alpha
  @y += 2
  @count += 1
  Window.drawAlpha(@x, @y, @orochi, @alpha)
  end
end
