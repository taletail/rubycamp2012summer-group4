# coding: utf-8

require_relative 'game/map'
require_relative 'game/player'
require_relative 'game/dice'

class Game
  def initialize
    @all_items = []
    @map = Map.new
    @players = [Player.new(@map), Player.new(@map)]
    @current_player_num = 0
    @dice = Dice.new
    @dicing = true
    @move_counter = 0.0
  end

  def play
    @map.draw
    @players.each do |player|
      player.draw
    end

    if @dicing	#転がし中
      @dice.rotate
      @dice.draw
      if Input.keyPush?(K_SPACE)
        @dicing = false
      end
    else
      @dice.draw
      @move_counter = @dice.current_num if @move_counter == 0.0
      @move_counter = @players[@current_player_num].move(@move_counter)	#1マス進める
      if @move_counter <= 0.0
        @players[@current_player_num].check_event
        @dicing = true
        @move_counter = 0.0
        @current_player_num += 1
        @current_player_num = 0 if @current_player_num == @players.size
      end
    end
  end
end
