# coding: utf-8

class Ending
  def initialize
  end

  # このシーンに切り替わった直後に呼ばれる処理
  def switched_this_scene
		@age = $player.age
		@won = ($orochi_hp <= 0)#@wonの判定は1で勝ち0で負けに変えておく
		if @won
			case @age 
				when 0
					bg_file = File.join(File.dirname(__FILE__),"..","images", "end0sai.png")#whenの部分に年齢を書く。年齢に応じた画像に書き換える。
				when 1..20
					bg_file = File.join(File.dirname(__FILE__),"..","images", "end20sai.png")
				when 21..50
					bg_file = File.join(File.dirname(__FILE__),"..","images", "end40sai.png")
				when 51..80
					bg_file = File.join(File.dirname(__FILE__),"..","images", "6080sai.png")
				else
					bg_file = File.join(File.dirname(__FILE__),"..","images", "90sai.png")
			end
			@ending = Image.load(bg_file)
		else
			@ending_animations = (1..4).map { |i|
				Image.load(File.join(File.dirname(__FILE__),"..","images", "oki0#{i}.jpg"))
			}
			@counter = 0
		end
	end

	def animation
		if @counter < 399
			Window.draw(99,0,@ending_animations[@counter/100])
		else
			@counter = 399
			Window.draw(99,0,@ending_animations[3])
		end
	end
  
	def play
  	if Input.keyPush?(K_RETURN)
			exit
   	end
		if @won
  		Window.draw(0,0,@ending)
  	else
			@counter += 1
			animation
		end
  end
end
