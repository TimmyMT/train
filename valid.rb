# frozen_string_literal: true

# Validation module for check classes
module Valid
  def valid?
    validate!
  rescue StandardError
    false
  end
end
