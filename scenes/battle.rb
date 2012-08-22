# coding: cp932

class Battle
  def initialize

    @battle_win1 = Image.new(200, 225, [0, 0, 255])
    @battle_win2 = Image.new(450, 225, [0, 0, 255])
#
    @hp_max_img = Image.new(100, 400, [255,255,255,])
    @hp_now_img = Image.new(100, 400, [0, 0, 255])
    @hp_bac_img = Image.new(100, 400, [255, 0, 0])
#
    @font = Font.new(30)
#
    @hp_max = 100.00
    @hp_now = 100.00
#

    @mark = Image.load("./images/mark.png")
    @orochi = Image.load("./images/orochii01.png")
    #@player = Image.load("images/ man#{}.jpg")
    
    @command = 0
    @push_RPG = 0
    @message1 = ""
    @message2 = ""
    @message3 = ""
    @message4 = ""
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
    Window.drawFont(300, 370, "#{@message1}", @font)
    Window.drawFont(300, 405, "#{@message2}", @font)
    Window.drawFont(300, 440, "#{@message3}", @font)
    Window.drawFont(300, 475, "#{@message4}", @font)
#   HP描写
    Window.drawFont(885, 50, "HP", @font) #後でplayer.hpに変更
    Window.drawAlpha(850, 90, @hp_max_img, 128)
    per = (@hp_now / @hp_max) * 100
    per1 = 90 + 4 * (100 - per)
    per2 = 4 * per
    aka = 255 * per / 100
    Window.drawMorph(850, per1, 950, per1, 950, 490, 850, 490, @hp_bac_img, {:alpha => aka})
    @hp_now = 70
#
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
      if $player.items[@command] = 0
        Window.drawFont(300, 370, "所持数ゼロ", font)
      else
=end
#      cal damege
#      cal damage
      if @push_RPG == 1
        orochi_damage = 50
        player_damage = 50
        @message1 = "#{item}を投げつけた"
        @message2 = "八岐大蛇に#{orochi_damage}のダメージ"
        @message3 = "八岐大蛇の攻撃"
        @message4 = "プレイヤーに#{player_damage}のダメージ"

#        $orochi_hp -= orochi_damage

#        $player.hp -= player_damage
      end
    end

  end
end