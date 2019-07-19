class Sesame

  attr_reader :api_url, :token

  def initialize(token)
    @token = token
    @endpoint_url = "https://api.candyhouse.co/public"
  end

  def lock_url(device_id)
    "#{@endpoint_url}/sesame/#{device_id}"
  end

  def list_url
    "#{@endpoint_url}/sesames"
  end

end