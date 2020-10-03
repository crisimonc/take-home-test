require_relative '../great_circle_distance'

RSpec.describe GreatCircleDistance do
  describe '#calculate' do
    let(:lat1)    { 53.1302756 }
    let(:lon1)    { -6.2397222 }
    let(:lat2)    { -6.257664 }
    let(:lon2)    { 53.339428 }
    let(:subject) { GreatCircleDistance.new(lat1: lat1, lon1: lon1, lat2: lat2, lon2: lon2) }

    it 'compute great circle distance between two points' do
      # source: https://www.movable-type.co.uk/scripts/latlong.html
      expect(subject.calculate).to eq(8628.326257865763)
    end
  end
end
