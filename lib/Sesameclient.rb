class Sesameclient
  def initialize(token)
    @api_url = "https://api.candyhouse.co/public"
    @token = token
  end

  def list_url
    "#{@api_url}/sesames"
  end

  def lock_url(device_id)
    "#{@api_url}/sesame/#{device_id}"
  end

  def lock_json
    message = {:command => 'lock'}
    message.to_json
  end

  def lock(device_id)
    client = HTTPClient.new
    client.post(lock_url(device_id), lock_json, 'Content-Type' => 'application/json', 'Authorization' => @token)
  end

  def devicelist
    client = HTTPClient.new
    client.get(url,header: [["Authorization", @token]])
  end

end
