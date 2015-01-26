require 'rest_client'

class RequestsSender
  MAX_JSON_COUNT = 10000
  MAX_USER_ID = 1000000

  attr_reader :url

  def initialize(url)
    @url = url
  end

  def send_requests
    loop do
      response = RestClient.post(url, json, header)
      p response
    end
  end

  private

    def header
      @_header ||= {content_type: :json, accept: :json}
    end

    def json
      user_ids = Array.new(MAX_JSON_COUNT) { rand(MAX_USER_ID) }
      user_ids.to_json
    end

end


sender = RequestsSender.new('http://httpbin.org/post')
sender.send_requests
