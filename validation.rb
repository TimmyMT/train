module Validation
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods
    attr_reader :validates
    def validate(name, *args)
      @validates ||= []
      @validates << { name => args }
    end
  end

  module InstanceMethods
    def validate!
      self.class.validates.each do |hh|
        hh.each do |name, args|
          val = instance_variable_get("@#{name}")
          send "validate_#{args[0]}", val, *args[1]
        end
      end
      true
    end

    def valid?
      validate!
    rescue RuntimeError
      false
    end

    private

    def validate_presence(val)
      raise 'Value is nil' if val.nil? || val.empty?
    end

    def validate_type(val, type)
      raise 'Invalid type' if val != type
    end

    def validate_format(val, format)
      raise 'Wrong format' if val !~ format
    end
  end
end
