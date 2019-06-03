module Accessors
  def my_accessor(*names)
    names.each do |name|

      line = "@#{name}".to_sym
      line_history = "@#{name}_history".to_sym

      define_method(name) { instance_variable_get(line) }

      define_method("#{name}=".to_sym) do |val|
        history = instance_variable_get(line_history) || []
        history.push(val)
        instance_variable_set(line_history, history)
        instance_variable_set(line, val)
      end

      define_method("#{name}_history".to_sym) do
        instance_variable_get(line_history) || []
      end

    end
  end

  def strong_accessor(name, clas)
    define_method((name.to_s).to_sym) { instance_variable_get("@#{name}".to_sym) }

    define_method("#{name}=".to_sym) do |val|
      if val.is_a? clas
        instance_variable_set("@#{name}".to_sym, val)
      else
        raise "wrong type"
      end
    end

  end
end
