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
    #   ���j���[�A��֕`��
    Window.draw(200, -5, @orochi)
    Window.drawAlpha(60, 360, @battle_win1, 128)
    Window.drawAlpha(290, 360, @battle_win2, 128)
    Window.drawFont(70, 370, "�V�W�~", @font)
    Window.drawFont(70, 405, "�Z��", @font)
    Window.drawFont(70, 440, "�o�_����", @font)
    Window.drawFont(70, 475, "�ʍ|", @font)
    Window.drawFont(70, 510, "��ы�", @font)
    Window.drawFont(70, 545, "�������C��", @font)
    Window.drawFont(300, 370, "#{@message1}", @font)
    Window.drawFont(300, 405, "#{@message2}", @font)
    Window.drawFont(300, 440, "#{@message3}", @font)
    Window.drawFont(300, 475, "#{@message4}", @font)
#   HP�`��
    Window.drawFont(885, 50, "HP", @font) #���player.hp�ɕύX
    Window.drawAlpha(850, 90, @hp_max_img, 128)
    per = (@hp_now / @hp_max) * 100
    per1 = 90 + 4 * (100 - per)
    per2 = 4 * per
    aka = 255 * per / 100
    Window.drawMorph(850, per1, 950, per1, 950, 490, 850, 490, @hp_bac_img, {:alpha => aka})
    @hp_now = 70
#
#   ���̈ړ��A�`��
    @command += 1 if Input.keyPush?(K_DOWN)
    @command -= 1 if Input.keyPush?(K_UP)
    @command -= 6 if @command > 5
    @command += 6 if @command < 0
    mark_point = (@command * 35) + 370
    Window.draw(30, mark_point, @mark)

#   �A�C�e���I�����̕ϐ��ύX

    if Input.keyPush?(K_RETURN)
      @push_RPG = 1
      case @command
      when 0
        item = "�V�W�~"
      when 1
        item = "�Z��"
      when 2
        item = "�o�_����"
      when 3
        item = "�ʍ|"
      when 4
        item = "��ы�"
      else
        item = "�������C��"
      end
#   �ύX���ꂽ�ϐ������Ƃɐ퓬
=begin
      if $player.items[@command] = 0
        Window.drawFont(300, 370, "�������[��", font)
      else
=end
#      cal damege
#      cal damage
      if @push_RPG == 1
        orochi_damage = 50
        player_damage = 50
        @message1 = "#{item}�𓊂�����"
        @message2 = "�����ւ�#{orochi_damage}�̃_���[�W"
        @message3 = "�����ւ̍U��"
        @message4 = "�v���C���[��#{player_damage}�̃_���[�W"

#        $orochi_hp -= orochi_damage

#        $player.hp -= player_damage
      end
    end

  end
end