require 'test_helper'

class Api::V1::ApplicationControllerTest < ActionDispatch::IntegrationTest
  test "ping" do
    get api_v1_ping_path
    assert jbody == Setting.suc.as_json
  end
end
