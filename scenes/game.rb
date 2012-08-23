# coding: cp932

require_relative 'game/map'
require_relative 'game/player'
require_relative 'game/dice'

class Game
  def initialize
    @all_items = []
    @map = Map.new
    @player = Player.new(@map)
    $player = @player
		
		@dice = Dice.new
    @dicing = true
    @move_counter = 0.0
		
		@selecting = true
    @select_route = 0.0
    
		@message_item = ""
		
		@massage_font = Font.new(22, "�l�r �S�V�b�N", weight: true)
		@message_font_large = Font.new(30)
    @age_font = Font.new(55, "�l�r �S�V�b�N", weight: true)
		@num_items_font = Font.new(20, "�l�r �S�V�b�N", weight: true)
  end

	def select
		#�����ŕ���̑I�����s���A�I��������false�ɂ���Aroute_no��0�`4�Œl������
		@select_route += Input.x * 0.2
		if @select_route < 0.0
			@select_route = 0.0
		elsif @select_route > 4.0
			@select_route = 4.0
		end
		@map.current_route = @select_route.to_i
		
		if Input.keyPush?(K_SPACE)
			@selecting = false
		end
	end
	
  def play
    # �}�b�v��`��
    @map.draw

		# �v���C���[��`��
		@player.draw
		
		#�A�C�e���擾���b�Z�[�W��\��������
		self.draw_get_item
		
		if Input.keyPush?(K_LSHIFT)
      $player = @player
			Scene.set_scene(:battle)
		end
		
		if @selecting
			self.select
		else
			if @dicing	#�]������
				@dice.rotate
				#�_�C�X��`��
				@dice.draw
				if Input.keyPush?(K_SPACE)
					@dicing = false
				end
			else
				#�_�C�X��`��
				@dice.draw
				
				route_no = @select_route.to_i
				@move_counter = @dice.current_num if @move_counter == 0.0
				@move_counter, @selecting = @player.move(@move_counter, route_no)	#1�}�X�i�߂�
				
				if @move_counter <= 0.0 || @selecting
					#�Ō�̃}�X��ʂ肷����悤�Ȃ�C�x���g�m�F���Ȃ�
					if @move_counter <= 0.0
						name = @player.check_event
					else 
						name = false
					end
					
					if name
						@message_item = "��#{name}\n���E����!"
					end
					
					@dicing = true
					@move_counter = 0.0
					#����
					@player.age += 10
					
					case @player.age
					when 1..30
						@player.hp = 150.00
					when 31..60
						@player.hp = 100.00
					when 61..80
						@player.hp = 70.00
					when 81..109
						@player.hp = 40.00
					end
					@player.img_change(@player.age)
				end
				if @player.age >= 110
					$player = @player
					Scene.set_scene(:ending)
				end
			end	
		end
		
    #���b�Z�[�W��\��������
    Window.drawFont(818, 315, "�A�C�e�����X�g", @massage_font, color: [255,255,255])
    Window.drawFont(170, 20, "SHIFT�L�[�������Ɣ����ւƐ퓬", @message_font_large)

    #�N���\��������
    Window.drawFont(870, 240, "#{@player.age}��", @age_font, color: [255,255,255])
    Window.drawFont(840, 80, "HP:#{@player.hp}", @message_font_large)
		#�N�ׂ̗ɃA�C�R����\��������
	  Window.draw(820,240, @player.img)

    
    #�A�C�e����\��������
		6.times do |i|
			if @player.items[i] > 0
				x = 840 + (i < 3 ? 0 : 1) * 80
				y = 340 + (i % 3) * 80
				Window.draw(x, y, ITEMS[i].image)
				Window.drawFont(x + 35 + 1, y + 35 + 1, @player.items[i].to_s, @num_items_font, color: [0,0,0])
				Window.drawFont(x + 35, y + 35, @player.items[i].to_s, @num_items_font, color: [190,230,244])
			end
		end

  end
	
	def draw_get_item
		Window.drawFont(818,10,@message_item, @massage_font, color: [255,255,255])
	end
end