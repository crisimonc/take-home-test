require_relative '../guest_list'

RSpec.describe GuestList do
  describe '#close_to' do
    let(:guest_list) { GuestList.new([
      { 'latitude' => '52.986375', 'user_id' => 12,'name' => 'Christina McArdle','longitude' => lon },
      { 'latitude' => lat,         'user_id' => 1, 'name' => 'Alice Cahill', 'longitude' => lon },
      { 'latitude' => '51.885616', 'user_id' => 2, 'name' => 'Ian McArdle', 'longitude' => '-10.4240951' },
      { 'latitude' => '52.3191841','user_id' => 3, 'name' => 'Jack Enright', 'longitude' => '-8.5072391' }
    ]) }
    let(:origin_lat) { 53.339428 } # Intercom Dublin's office lat
    let(:origin_lon) { -6.257664 } # Intercom Dublin's office lon
    subject          { guest_list.process(origin_lat, origin_lon) }

    context 'there are customers close by' do
      let(:lat) { '53.339428' }
      let(:lon) { '-6.257664' }

      it 'returns name and ids of customers within 100 km of a given point' do
        expect(subject.class).to eq(Array)
        expect(subject).to eq([{ 'name' => 'Alice Cahill', 'user_id' => 1 }, { 'name' => 'Christina McArdle', 'user_id' => 12 }])
      end
    end

    context 'there are no customers close by' do
      let(:lat) { '51.92893' }
      let(:lon) { '-10.27699' }
      it 'returns an empty array' do
        expect(subject.class).to eq(Array)
        expect(subject).to eq([])
      end
    end
  end
end
