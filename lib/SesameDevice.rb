require 'httpclient'
require 'json'

class SesameDevice

  def initialize(token)
    @log_array = []

  end

  def get_log
    puts @log_array
  end

  def url
    "#{@api_url}/sesames"
  end

  def req(url,token)
    client = HTTPClient.new
    res = client.get(url,header: [["Authorization", token]])
  end

  def ids
    result = []
    p res.status

    res_json = JSON.parse(res.body)

    res_json.each { |data| result.push(data["device_id"]) }
    result
  end



end