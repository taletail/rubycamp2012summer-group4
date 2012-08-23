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
		
		@massage_font = Font.new(22, "ＭＳ ゴシック", weight: true)
		@message_font_large = Font.new(30)
    @age_font = Font.new(55, "ＭＳ ゴシック", weight: true)
		@num_items_font = Font.new(20, "ＭＳ ゴシック", weight: true)
  end

	def select
		#ここで分岐の選択を行い、選択したらfalseにする、route_noに0～4で値を入れる
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
    # マップを描画
    @map.draw

		# プレイヤーを描画
		@player.draw
		
		#アイテム取得メッセージを表示させる
		self.draw_get_item
		
		if Input.keyPush?(K_LSHIFT)
      $player = @player
			Scene.set_scene(:battle)
		end
		
		if @selecting
			self.select
		else
			if @dicing	#転がし中
				@dice.rotate
				#ダイスを描画
				@dice.draw
				if Input.keyPush?(K_SPACE)
					@dicing = false
				end
			else
				#ダイスを描画
				@dice.draw
				
				route_no = @select_route.to_i
				@move_counter = @dice.current_num if @move_counter == 0.0
				@move_counter, @selecting = @player.move(@move_counter, route_no)	#1マス進める
				
				if @move_counter <= 0.0 || @selecting
					#最後のマスを通りすぎるようならイベント確認しない
					if @move_counter <= 0.0
						name = @player.check_event
					else 
						name = false
					end
					
					if name
						@message_item = "▼#{name}\nを拾った!"
					end
					
					@dicing = true
					@move_counter = 0.0
					#加齢
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
		
    #メッセージを表示させる
    Window.drawFont(818, 315, "アイテムリスト", @massage_font, color: [255,255,255])
    Window.drawFont(170, 20, "SHIFTキーを押すと八岐大蛇と戦闘", @message_font_large)

    #年齢を表示させる
    Window.drawFont(870, 240, "#{@player.age}歳", @age_font, color: [255,255,255])
    Window.drawFont(840, 80, "HP:#{@player.hp}", @message_font_large)
		#年の隣にアイコンを表示させる
	  Window.draw(820,240, @player.img)

    
    #アイテムを表示させる
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