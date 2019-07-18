class SemameControl
  def initialize(sesame)
    @sesame = sesame

  end

  def lock_json
    message = {:command => 'lock'}
    message.to_json
  end

  def lock(device_id)
    url = "#{@sesame.url}/sesame/#{device_id}"
    client = HTTPClient.new
    res = client.post(url, self.lock_json, 'Content-Type' => 'application/json', 'Authorization' => @sesame.token)

    @log_array = [res.body, res.status]
    if (res.status = 200)
      true
    else
      false
    end
  end

  def locks(device_ids)
    device_ids.each do |device_id|
      self.lock(device_id)
    end
  end

  def alllock
    self.ids.each do |device_id|
      self.lock(device_id)
    end
  end

end