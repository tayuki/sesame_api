class Sesameclient
  def initialize()
    @api_url = "https://api.candyhouse.co/public"
  end

  def list_url
    "#{@api_url}/sesames"
  end

  def lock_url(deviceid)
    "#{@api_url}/sesame/#{deviceid}"
  end

  def lock_json
    message = {:command => 'lock'}
    message.to_json
  end

  def lock
    client = HTTPClient.new
    res = client.post(lock_url, lock_json, 'Content-Type' => 'application/json', 'Authorization' => @token)
  end

end
