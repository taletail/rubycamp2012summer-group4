# coding: utf-8
=begin
	サンプルでは2人用だったものを1人用に変更した。(津田)

=end


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
    
    @massage_font = Font(40, "ＭＳ ゴシック", weight: true)
    
    @age_font = Font.new(55, "ＭＳ ゴシック", weight: true)
  end

  def play
    # マップを描画
    @map.draw
    
	# プレイヤーを描画
	@player.draw
				
	#ここで分岐の選択を行い、選択したらfalseにする
	@selecting = false
	if @selecting
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
				
				route_no = 0	#一番左のルート
				@move_counter = @dice.current_num if @move_counter == 0.0
				@move_counter, @selecting = @player.move(@move_counter, route_no)	#1マス進める
				
				if @move_counter <= 0.0 || !@selecting
					#@player.check_event
					@dicing = true
					@move_counter = 0.0
				end
			end
			
		end
		
    #メッセージを表示させる
    Window.drawFont(820,10,"しじみを手に入れた", @massage_font, [255,255,255])

    #年齢を表示させる
    Window.drawFont(820, 230, "10歳", @age_font, [255,255,255])
  end
end