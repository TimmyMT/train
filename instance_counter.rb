# frozen_string_literal: true

# this is a counter for quantity elements
module InstanceCounter
  def self.included(base)
    base.extend ClassMethods
    base.include InstanceMethods
  end

  # methods for class
  module ClassMethods
    attr_writer :instances

    def instances
      @instances ||= 0
    end
  end

  # methods for instatnce
  module InstanceMethods
    protected

    def register_instance
      self.class.instances += 1
    end
  end
end
