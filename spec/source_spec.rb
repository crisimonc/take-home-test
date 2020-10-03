require_relative '../source'

RSpec.describe Source do
  describe '#parse' do
    let(:source) { Source.new(url) }
    subject      { source.parse }

    context 'when URL is valid' do
      let(:url) { 'https://s3.amazonaws.com/intercom-take-home-test/customers.txt' }

      it 'parse data from URL into array' do
        expect(subject.class).to eq(Array)
        expect(subject.count).to eq(32)
        expect(subject).to include('latitude' => '51.802', 'user_id' => 21, 'name' => 'David Ahearn', 'longitude' => '-9.442')
      end
    end

    context 'when URL is valid' do
      let(:url) { 'https.txt' }

      it 'return the error message' do
        expect(subject).to eq('unknown scheme: ')
      end
    end
  end
end
