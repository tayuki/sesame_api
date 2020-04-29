require 'httpclient'
require 'json'

class Sesame
  def initialize(token)
    @token = token
    @log_array = []
    @api_url = "https://api.candyhouse.co/public"
  end

  def get_log
    puts @log_array
  end

  def get_device_ids
    result = []
    url = "#{@api_url}/sesames"
    client = HTTPClient.new
    res = client.get(url,header: [["Authorization", @token]])
    p res.status

    res_json = JSON.parse(res.body)

    res_json.each { |data| result.push(data["device_id"]) }
    result
  end

  def make_lock_json
    message = {:command => 'lock'}
    message.to_json
  end

  def lock(deviceid)
    url = "#{@api_url}/sesame/#{deviceid}"

    client = HTTPClient.new
    res = client.post(url, self.make_lock_json, 'Content-Type' => 'application/json', 'Authorization' => @token)
    @log_array = [res.body, res.status]
    if res.status = 200
      true
    else
      false
    end
  end

  def lock?(deviceid)
    url = "#{@api_url}/sesame/#{deviceid}"

    client = HTTPClient.new
    res = client.get(url,header: [["Authorization", @token]])
    @log_array = [res.body, res.status]
    if res.status = 200
      result = JSON.parse(res.body)
      puts result["locked"]
    else
      false
    end
  end


  def locks(deviceids)
    deviceids.each do |device_id|
      self.lock(device_id)
    end
  end

  def alllock
    self.get_device_ids.each do |device_id|
      self.lock(device_id)
    end
  end
end
