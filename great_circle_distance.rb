# Great Circle Distance

require_relative 'converter'

class GreatCircleDistance
  include Math
  include Converter

  EARTH_RADIUM = 6371 # km

  def initialize(lat1:, lon1:, lat2:, lon2:)
    @lat1 = lat1
    @lon1 = lon1
    @lat2 = lat2
    @lon2 = lon2
  end

  def calculate
    # great circle distance = sphere radius * central angle
    EARTH_RADIUM * central_angle
  end

  private

  def central_angle
    # arccos( sin(lat1) * sin(lat2) + cos(lat1) * cos(lat2) * cos(abs_lon_distance) )
    acos(sin(Converter.to_rad(@lat1)) * sin(Converter.to_rad(@lat2)) + cos(Converter.to_rad(@lat1)) * cos(Converter.to_rad(@lat2)) * cos(abs_longitudine_difference))
  end

  def abs_longitudine_difference
    # absolute value of longitudines difference in radiant
    (Converter.to_rad(@lon1) - Converter.to_rad(@lon2)).abs
  end
end
