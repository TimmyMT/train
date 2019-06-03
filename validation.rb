module Validation
  def self.included(base)
    base.extend ClassMethods
  end

  module ClassMethods

    def validate(name, type, val = nil)
      define_method("validate_#{name}_#{type}") do
        var = instance_variable_get("@#{name}".to_sym)

        case type
        when :presence
          raise "#{name} nil" if var.nil? || var.strip.empty?
        when :format
          raise 'wrong format!' if var !~ val
        when :type
          raise 'wrong type!' unless var.is_a? val
        end

      end

      define_method(:validate!) do
        methods.each do |method|
          send method if method.to_s.start_with?('validate_')
        end
      end

      define_method(:valid?) do
        validate!
        true
      rescue Error
        false
      end
    end

  end

end
