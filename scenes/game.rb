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
    
		@massage_font = Font.new(40, "ＭＳ ゴシック", weight: true)
    @age_font = Font.new(55, "ＭＳ ゴシック", weight: true)
  end

	def select
		#ここで分岐の選択を行い、選択したらfalseにする、route_noに0～4で値を入れる
		@select_route += Input.x * 0.2
		if @select_route < 0.0
			@select_route = 0.0
		elsif @select_route > 4.0
			@select_route = 4.0
		end
		
		if Input.keyPush?(K_SPACE)
			@selecting = false
		end
	end
	
  def play
    # マップを描画
    @map.draw
		# プレイヤーを描画
		@player.draw
		
		if Input.keyPush?(K_LSHIFT)
			Scene.set_scene(:battle)
		end
		
		if @selecting
			select
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
					@player.check_event
					@dicing = true
					@move_counter = 0.0
					#加齢
					@player.age += 10
					@player.img_change(@player.age)
				end
			end
			
		end
		
    #メッセージを表示させる
    Window.drawFont(820,10,"取得アイテムリスト\nルート#{@select_route.to_i}", @massage_font, color: [255,255,255])

    #年齢を表示させる
    Window.drawFont(820, 230, "#{@player.age}歳", @age_font, color: [255,255,255])
    
    #アイテムを表示させる
		6.times do |i|
			if @player.items[i] > 0
				Window.draw(820 + (i < 3 ? 0 : 1) * 80, 320 + (i % 3) * 80, ITEMS[i].image)
			end
		end

  end
end