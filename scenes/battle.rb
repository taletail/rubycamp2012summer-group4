# coding: cp932

class Battle
  def initialize
#    bg_file = File.join(File.dirname(__FILE__), "..", "images")
#    @background_img = Image.load(bg_file)


    @battle_win1 = Image.new(200, 225, [0, 0, 255])
    @battle_win2 = Image.new(450, 225, [0, 0, 255])
    @font = Font.new(30)

    @mark = Image.load("./images/mark.png")
    @orochi = Image.load("./images/orochii01.png")
    #@player = Image.load("images/ man#[].jpg")

    @command = 0
    $push = 0
    @push_RPG = 0
  end

  def play
    #   メニュー、大蛇描写
    Window.draw(200, -5, @orochi)
    Window.drawAlpha(60, 360, @battle_win1, 128)
    Window.drawAlpha(290, 360, @battle_win2, 128)
    Window.drawFont(70, 370, "シジミ", @font)
    Window.drawFont(70, 405, "算盤", @font)
    Window.drawFont(70, 440, "出雲そば", @font)
    Window.drawFont(70, 475, "玉鋼", @font)
    Window.drawFont(70, 510, "飛び魚", @font)
    Window.drawFont(70, 545, "島根ワイン", @font)

#   矢印の移動、描写
    @command += 1 if Input.keyPush?(K_DOWN)
    @command -= 1 if Input.keyPush?(K_UP)
    @command -= 6 if @command > 5
    @command += 6 if @command < 0
    mark_point = (@command * 35) + 370
    Window.draw(30, mark_point, @mark)

#   アイテム選択時の変数変更
    if Input.keyPush?(K_RETURN)
      @push_RPG = 1
      case @command
      when 0
        item = "シジミ"
      when 1
        item = "算盤"
      when 2
        item = "出雲そば"
      when 3
        item = "玉鋼"
      when 4
        item = "飛び魚"
      else
        item = "島根ワイン"
      end
#   変更された変数をもとに戦闘
=begin
      if number[common] = 0
        Window.drawFont(300, 370, "所持数ゼロ", font)
      else
=end
#      cal damege
#      cal damage
      if @push_RPG == 1
        damage = 50
        Window.drawFont(300, 370, "#(item)を投げつけた", @font)
        Window.drawFont(300, 405, "八岐大蛇に#(damage)のダメージ", @font)
        Window.drawFont(300, 440, "八岐大蛇の攻撃", @font)
        Window.drawFont(300, 475, "プレイヤーに#(damage)のダメージ", @font)
      end
#     end
 
    end
  end
end