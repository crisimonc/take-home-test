# Converts Degrees to Radian

module Converter
  DEGREE_TO_RADIAN = 0.0174533

  def self.to_rad(coordinate)
    coordinate * DEGREE_TO_RADIAN
  end
end
