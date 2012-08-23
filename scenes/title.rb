# coding: utf-8

class Title
  def initialize
    bg_file = File.join(File.dirname(__FILE__), "..", "images", "start.png")
		music = File.join(File.dirname(__FILE__), "..", "sound", "opening.wav")
    @background_img = Image.load(bg_file)
		@opening_music = Sound.new(music)
		@played = 0
    @pushed_space = false
    @alpha = 255
  end

  def play
    if Input.keyPush?(K_SPACE)
      @pushed_space = true
    end
		
		if @played == 0
			@opening_music.play
			@played = 1
		end

    if @pushed_space
      @alpha -= 7
      if @alpha <= 0
        @alpha = 0
      end
      Window.drawAlpha(100, 0, @background_img, @alpha)
      if @alpha <= 0
        Scene.set_scene(:game)
      end
    else
      Window.draw(100, 0, @background_img)
    end
  end
end
