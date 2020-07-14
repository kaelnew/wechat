require 'test_helper'

class WechatTest < ActiveSupport::TestCase
  test "get_access_token_by_wechat" do
    app_id = Rails.application.credentials.metrix_app_id
    app_secret = Rails.application.credentials.metrix_app_secret
    result = Wechat.get_access_token_by_wechat(app_id, app_secret)
    assert result['access_token']
    assert result['expires_in'] == 7200
  end

  test "get_access_token" do
    app_id = Rails.application.credentials.metrix_app_id
    app_secret = Rails.application.credentials.metrix_app_secret
    token = Wechat.get_access_token(app_id, app_secret)
    assert token
    Rails.logger.info($redis.get(Wechat.token_key(app_id)))
  end
end