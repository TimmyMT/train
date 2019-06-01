# frozen_string_literal: true

module Valid
  def valid?
    validate!
  rescue StandardError
    false
  end
end
