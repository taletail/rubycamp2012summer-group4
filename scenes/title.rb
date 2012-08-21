# coding: utf-8

class Title
  def initialize
    bg_file = File.join(File.dirname(__FILE__), "..", "images", "title_bg.png")
    @background_img = Image.load(bg_file)

    @title_font = Font.new(64, "ＭＳ ゴシック", weight: true)
    @title_str = "サンプルボードゲーム"
    @title_x = Util.get_center(@title_str, @title_font)

    @description_font = Font.new(24, "ＭＳ ゴシック", weight: true)
    @description_str = "スペースキーを押下して開始してください"
    @description_x = Util.get_center(@description_str, @description_font)
  end

  def play
    Window.draw(0, 0, @background_img)
    Window.drawFont(@title_x, 10, @title_str, @title_font, color: Util::YELLOW)
    Window.drawFont(@description_x, 400, @description_str, @description_font, color: Util::YELLOW)

    if Input.keyPush?(K_SPACE)
      Scene.set_scene(:game)
    end
  end
end
