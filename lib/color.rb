require 'color/name'
require 'color/hex'

module Color
  def self.parse(value)
    if value =~ /^\#{0,1}[a-f0-9]{6}$/i
      return Color.hex(value)
    elsif value.is_a?(Array)
      # TODO: Validate RGB color array
      return value
    elsif Color::NAMES.has_key?(value.downcase.to_sym)
      return Color.name(value)
    else
      raise "Unknown color format"
    end
  end
end