# frozen_string_literal: true

module ErrorSerializer
  def self.serialize(errors)
    return if errors.nil?

    errors.to_hash(true).map do |k, v|
      v.map do |msg|
        { field: k, message: msg }
      end
    end.flatten
  end
end
