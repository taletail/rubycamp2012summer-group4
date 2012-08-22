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
      if number[common] = 0
        Window.drawFont(300, 370, "�������[��", font)
      else
=end
#      cal damege
#      cal damage
      if @push_RPG == 1
        damage = 50
        Window.drawFont(300, 370, "#(item)�𓊂�����", @font)
        Window.drawFont(300, 405, "�����ւ�#(damage)�̃_���[�W", @font)
        Window.drawFont(300, 440, "�����ւ̍U��", @font)
        Window.drawFont(300, 475, "�v���C���[��#(damage)�̃_���[�W", @font)
      end
#     end
 
    end
  end
end