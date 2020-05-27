require 'test_helper'

class Api::V1::PublicControllerTest < ActionDispatch::IntegrationTest
  test "signature false" do
    get api_v1_signature_path
    assert @response.body == 'false'
  end
end
