class Api::V1::ApplicationController < ActionController::API
  def ping
    render json: Setting.suc
  end
end
