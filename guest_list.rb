# Customer List

require_relative 'great_circle_distance'

require 'pry'

class GuestList
  DISTANCE_THRESHOLD = 100
  def initialize(customers_array)
    @customers = customers_array
  end

  def process(origin_lat, origin_long)
    close_to(origin_lat, origin_long).sort_by { |customer| customer["user_id"] }
  end

  private

  def close_to(origin_lat, origin_long)
    @customers.map do |customer|
      lat  = customer['latitude'].to_f
      long = customer['longitude'].to_f
      distance = GreatCircleDistance.new(lat1: origin_lat, lon1: origin_long, lat2: lat, lon2: long).calculate
      next if distance > DISTANCE_THRESHOLD

      { 'user_id' => customer['user_id'], 'name' => customer['name'] }
    end.compact
  end
end
