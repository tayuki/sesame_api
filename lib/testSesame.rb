require 'minitest/autorun'
require 'minitest/reporters'

MiniTest::Reporters.use!

require './Sesame.rb'

class SesameTest < Minitest::Test
  def setup
    @sesame = Sesame.new('testtoken')
  end

  def test_access_token
    assert_equal @sesame.token, 'testtoken', true
  end

  def test_lock_url
    assert_equal @sesame.lock_url('device_testid'), 'https://api.candyhouse.co/public/sesame/device_testid', true
    assert_equal @sesame.lock_url(2), 'https://api.candyhouse.co/public/sesame/2', true
  end

  def test_list_url
    assert_equal @sesame.list_url, 'https://api.candyhouse.co/public/sesames', true
  end

end