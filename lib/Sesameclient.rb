class SesameClient
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

  def call_devices
    client = HTTPClient.new
    client.get(url,header: [["Authorization", @token]])
  end

  # @return [Array]
  def device_id_list
    device_ids = response_to_device_ids(JSON.parse(call_devices.body))
    device_list = device_ids.each { |device_id| device_id }
    device_list
  end

  def response_to_device_ids(response_json)
    device_ids = []
    response_json.each { |data| device_ids.push(data["device_id"]) }
    device_ids
  end

end
