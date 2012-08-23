# coding: cp932

class Battle
  def initialize

    @battle_win1 = Image.new(200, 225, [0, 0, 255])
    @battle_win2 = Image.new(450, 225, [0, 0, 255])

    @hp_max_img = Image.new(100, 400, [255,255,255,])
    @hp_now_img = Image.new(100, 400, [0, 0, 255])
    @hp_bac_img = Image.new(100, 400, [255, 0, 0])

    @font = Font.new(27)
    @mark = Image.load("./images/mark.png")
    @orochi = Image.load("./images/orochii01.png")

    @item = ["�V�W�~", "�Z��", "�o�_����", "���{��", "��ы�", "�������C��", "����"]
    @message1 = "�����ւ������ꂽ"
    @message2 = ""
    @message3 = ""
    @message4 = ""
  end
  
  def switched_this_scene
    @orochi_hp = 100
    $player.hp = rand(500.00) + 1.00 if $player.age == 0
    @hp_max = $player.hp

    @item_power = [10, 30, 20, 50, 40, 10]
    @command = 0
    @count = 0
    @select = 7
    @draw_x = 200
    @draw_y = 300
    @scale_x = -1.00
    @scale_y = 1.00
    @spin = 0.00
    @bgm_battle = Sound.new("./sound/boss.wav")
    @bgm_switch = 0

    $won = 0

  end

  def play
    if @bgm_switch == 0
      @bgm_battle.play
      @bgm_switch = 1
    end
    @count += 1
    #   ���j���[�A��֕`��
    Window.draw(200, -5, @orochi)
    Window.drawAlpha(60, 360, @battle_win1, 128)
    Window.drawAlpha(290, 360, @battle_win2, 128)
    Window.drawFont(70, 370, "�V�W�~", @font)
    Window.drawFont(70, 400, "�Z��", @font)
    Window.drawFont(70, 430, "�o�_����", @font)
    Window.drawFont(70, 460, "�ʍ|", @font)
    Window.drawFont(70, 490, "��ы�", @font)
    Window.drawFont(70, 520, "�������C��", @font)
    Window.drawFont(70, 550, "�f��", @font)
    #   �퓬�A�j���[�V����
    case @select
    when 0
      @item_ef = Image.load("./images/shizimi.png")
      sound = Sound.new("./sound./shizimi.wav")
      @draw_x += 6
      @draw_y -= 2
      @scale_x += 0.015
      @scale_y -= 0.015
      @spin += 1.8
      Window.drawEx(@draw_x, @draw_y, @item_ef, {:scalex => @scale_x, :scaley => @scale_y, :angle => @spin})
    when 1
      @item_ef = Image.load("./images/soroban.png")
      sound = Sound.new("./sound./soroban.wav")
      @draw_x += 6
      @draw_y -= 2
      @scale_x += 0.015
      @scale_y -= 0.015
      @spin += 1.8
      Window.drawEx(@draw_x, @draw_y, @item_ef, {:scalex => @scale_x, :scaley => @scale_y, :angle => @spin})
    when 2
      @item_ef = Image.load("./images/soumen.png")
      sound = Sound.new("./sound./soumen.wav")
      @draw_x += 6
      @draw_y -= 2
      @scale_x += 0.015
      @scale_y -= 0.015
      @spin += 1.8
      Window.drawEx(@draw_x, @draw_y, @item_ef, {:scalex => @scale_x, :scaley => @scale_y, :angle => @spin})
    when 3
      if @count == 1
        sound = Sound.new("./sound./tatara.wav")
        sound.play
      end
      @item_ef = Image.load("./images/tatara.png")
      @draw_x += 6
      @draw_y = 300 + (1.6 * @count * @count) - (80 * @count)
      @draw_y -= 2 * @count
      @scale_x += 0.015
      @scale_y -= 0.015
      @spin += 1.8
      Window.drawEx(@draw_x, @draw_y, @item_ef, {:scalex => @scale_x, :scaley => @scale_y, :angle => @spin})
    when 4
      @item_ef = Image.load("./images/tobiuo.png")
      sound = Sound.new("./sound./tobiuo.wav")
      @draw_x += 6
      @draw_y -= 2
      @scale_x += 0.015
      @scale_y -= 0.015
      Window.drawScale(@draw_x, @draw_y, @item_ef, @scale_x, @scale_y)
    when 5
      @item_ef = Image.load("./images/wine.png")
      sound = Sound.new("./sound./wine.wav")
      @draw_x += 6
      @draw_y -= 2
      @scale_x += 0.015
      @scale_y -= 0.015
      @spin += 1.8
      Window.drawEx(@draw_x, @draw_y, @item_ef, {:scalex => @scale_x, :scaley => @scale_y, :angle => @spin})
    when 6
      @item_ef = Image.load("./images/men#{$player.age}.png")
      sound = Sound.new("./sound./sude.wav")
      @draw_x += 6
      @draw_y -= 2
      @scale_x += 0.015
      @scale_y -= 0.015
      @spin += 1.8
      Window.drawEx(@draw_x, @draw_y, @item_ef, {:scalex => @scale_x, :scaley => @scale_y, :angle => @spin})
    end
    if @draw_x == 500
      sound.play if @select != 3
      @draw_x = 200
      @draw_y = 300
      @scale_x = -1.00
      @scale_y = 1.00
      @angle = 0.00
      @select = 7
    end
#   �_���[�W�\��
    Window.drawFont(300, 370, "#{@message1}", @font)
    Window.drawFont(300, 400, "#{@message2}", @font)
    if @orochi_hp <= 0
      $won = 1 
      Scene.set_scene(:ending)
    elsif $player.hp > 0
      Window.drawFont(300, 430, "#{@message3}", @font)
      Window.drawFont(300, 460, "#{@message4}", @font)
    else
      $won = 2 if $player.hp <= 0
      Scene.set_scene(:ending)
    end
#   HP�`��
    Window.drawFont(885, 50, "HP", @font) #���player.hp�ɕύX
    Window.drawAlpha(850, 90, @hp_max_img, 128)
    per = $player.hp / @hp_max * 100
    per1 = 90 + 4 * (100 - per)
    per2 = 4 * per
    aka = 50 + (205 * per / 100)
    Window.drawMorph(850, per1, 950, per1, 950, 490, 850, 490, @hp_bac_img, {:alpha => aka})
#   ���̈ړ��A�`��
    @command += 1 if Input.keyPush?(K_DOWN)
    @command -= 1 if Input.keyPush?(K_UP)
    @command -= 7 if @command > 6
    @command += 7 if @command < 0
    mark_point = (@command * 30) + 370
    Window.draw(30, mark_point, @mark)
#   �A�C�e���I�����̕ϐ��ύX
    if Input.keyPush?(K_RETURN)
      @select = @command
      @count = 0
#   �ύX���ꂽ�ϐ������Ƃɐ퓬
      if $player.items[@select] == 0
        @message1 = "�������[��"
        @message2 = ""
        @message3 = ""
        @message4 = ""
        @select = 7
      else
        if @select == 6
          orochi_damage = rand(21)
        else
          orochi_damage = @item_power[@select] + rand(7) - 3
         $player.items[@select] -= 1
        end
          player_damage = 30
          @message1 = "#{@item[@select]}�𓊂�����"
          @message2 = "�����ւ�#{orochi_damage}�̃_���[�W"
          @message3 = "�����ւ̍U��"
          @message4 = "�v���C���[��#{player_damage}�̃_���[�W"

          @orochi_hp -= orochi_damage
          $player.hp -= player_damage
        end
      end
    end
end