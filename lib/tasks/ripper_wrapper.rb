require 'ripper'

class RipperWrapper < Ripper
  attr_reader :code

  def initialize(src)
    super(src)

    @code = Hash.new()
    @code[:classes] = Array.new()
    @code[:modules] = Array.new()
    @code[:methods] = Array.new()

    @params = Array.new()
  end

  # クラス
  def on_class(class_name, arg, body)
    @code[:classes] << {:class => class_name}
  end

  # モジュール
  def on_module(module_name, body)
    @code[:modules] << {:module => module_name}
  end

  # メソッド
  def on_def(method_name, arg, body)
    @code[:methods] << {:def => method_name}
  end

  # 定数
  def on_assign(arg, body)
    @code[arg] = @params[0]
    @params.clear
  end
end
