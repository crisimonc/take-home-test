require_relative 'source'
require_relative 'guest_list'

# Source URL
url = 'https://s3.amazonaws.com/intercom-take-home-test/customers.txt'
# Customers List
customers = Source.new(url).parse
# Process guest list for Dublin event
dublin_latitude  = 53.339428
dublin_longitude = -6.257664

puts GuestList.new(customers).process(dublin_latitude, dublin_longitude).map { |c| "#{c['user_id']}, #{c['name']}" }
