class DeviceLoader
  def initialize(client)
    @client = client
  end

  def response_to_device_ids(response_json)
    device_ids = []
    response_json.each { |data| device_ids.push(data["device_id"]) }
    device_ids
  end

  device_ids = response_to_device_ids(JSON.parse(@client.devicelist.body))

  device_ids.each { |device_id| device_id }

end