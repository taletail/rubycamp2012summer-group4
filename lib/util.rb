# coding: utf-8

# ゲーム全体で汎用的に使い回せる定数やメソッドをまとめるモジュール
module Util
  # 色を表す定数
  YELLOW = [255, 255, 0]
  RED        = [255, 0, 0]
  GREEN   = [0, 255, 0]
  BLUE      = [0, 0, 255]

  module_function

  # 文字列を画面の横中央に配置する際のX座標を計算する
  def get_center(str, font)
    return (Window.width - font.get_width(str)) / 2
  end
end
