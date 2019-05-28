module Block
  def self.included(base)
    base.include InstanceMethods
  end

  module InstanceMethods
    protected

    def block
      yield
    end
  end

end