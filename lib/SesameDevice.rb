require 'httpclient'
require 'json'

class SesameDevice

  def initialize(token,device_id)
    client = HTTPClient.new
    @data = client.get(url,header: [["Authorization", token]])
  end

  def lock

  end

  def json_to_device_ids(json)
    json_obj = JSON.parse(json)
    json_obj.each { |data| result.push(data["device_id"]) }
    result
  end

  def ids
    self.json_to_device_ids(@data.body)
  end

end