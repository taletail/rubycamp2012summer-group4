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
    
		@massage_font = Font.new(22, "�l�r �S�V�b�N", weight: true)
		@massage_font_small = Font.new(18, "�l�r �S�V�b�N", weight: true)
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
					@player.check_event
					@dicing = true
					@move_counter = 0.0
					#����
					@player.age += 10
					
					case @player.age
					when 1..30
						@player.hp = 150
					when 31..60
						@player.hp = 100
					when 61..80
						@player.hp = 70
					when 81..109
						@player.hp = 40
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
    Window.drawFont(818,10,"�A�C�e�����X�g", @massage_font, color: [255,255,255])

    #�N���\��������
    Window.drawFont(820, 230, "#{@player.age}��", @age_font, color: [255,255,255])
    
    #�A�C�e����\��������
		6.times do |i|
			if @player.items[i] > 0
				x = 840 + (i < 3 ? 0 : 1) * 80
				y = 340 + (i % 3) * 80
				Window.draw(x, y, ITEMS[i].image)
				Window.drawFont(x + 35, y + 35, @player.items[i].to_s, @num_items_font, color: [50,50,200])
			end
			


		end

  end
end