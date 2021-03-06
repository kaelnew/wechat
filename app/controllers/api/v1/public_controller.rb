class Api::V1::PublicController < Api::V1::ApplicationController
  def signature
    Rails.logger.info("params: #{params}")
    token = Rails.application.credentials.metrix_token
    a = [token, params[:timestamp].to_s, params[:nonce].to_s]
    b = Digest::SHA1.hexdigest(a.sort.join('')) == params[:signature]
    r = b ? params[:echostr] : 'false'
    render plain: r
  end
end
