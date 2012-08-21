# ゲームのシーン（場面）を管理するクラス
class Scene
  @@scenes = {}
  @@current_scene_name = nil

  # シーンオブジェクトを一括読み込みする
  def self.load_scenes(scenes_dirname = "scenes")
    target_path = File.join(File.dirname(__FILE__), "..", scenes_dirname, "*.rb")
    Dir.glob(target_path) do |file|
      require file
      base_name  = File.basename(file, ".*")
      class_name = base_name.split("_").map{|part| part.downcase.capitalize}.join("").to_sym
      scene_obj  = Object.const_get(class_name).new
      @@scenes[base_name.to_sym] = scene_obj
    end
  end

  # シーンオブジェクトのカレントを切り替える
  def self.set_scene(scene_name)
    @@current_scene_name = scene_name.to_sym
  end

  # 現在設定されているシーンオブジェクトのplayメソッドを実行
  def self.play
    @@scenes[@@current_scene_name].play
  end
end