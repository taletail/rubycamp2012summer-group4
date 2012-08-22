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
  end

  def play
    # マップを描画
    @map.draw

    # プレイヤーを描画
    @player.draw
   
    if @dicing	#転がし中
      @dice.rotate
      #ダイスを描画
      @dice.draw
      if Input.keyPush?(K_SPACE)
        @dicing = false
      end
    else
		  #Scene.set_scene(:ending)
			#return

      #ダイスを描画
      @dice.draw
      route_no = 0	#一番左のルート
      @move_counter = @dice.current_num if @move_counter == 0.0
      @move_counter = @player.move(@move_counter, route_no)	#1マス進める
      
     if @move_counter <= 0.0
        @player.check_event
        @dicing = true
        @move_counter = 0.0
      end
    end
  end
end