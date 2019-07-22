class Lock
  def initialize(client,devices)
    @client = client
    @devices = devices
  end

  def lockall

  end

  def lock
    @devices.each do |device|
      @client.lock(device.id)
    end
  end

end
