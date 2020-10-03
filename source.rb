# Source
require 'http'

class Source
  def initialize(url)
    @url = url
  end

  def parse
    response = HTTP.get(@url)
    raise 'An error has occured' unless response.code == 200

    response.body.to_s.split("\n").map { |hash_string| JSON.parse(hash_string) }
  rescue => e
    e.message
  end
end

