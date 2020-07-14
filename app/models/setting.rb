# RailsSettings Model
class Setting < RailsSettings::Base
  # cache_prefix { "v1" }

  # Define your fields
  # field :host, type: :string, default: "http://localhost:3000"
  # field :default_locale, default: "en", type: :string
  # field :confirmable_enable, default: "0", type: :boolean
  # field :admin_emails, default: "admin@rubyonrails.org", type: :array
  # field :omniauth_google_client_id, default: (ENV["OMNIAUTH_GOOGLE_CLIENT_ID"] || ""), type: :string, readonly: true
  # field :omniauth_google_client_secret, default: (ENV["OMNIAUTH_GOOGLE_CLIENT_SECRET"] || ""), type: :string, readonly: true
  field :suc, type: :hash, default: {
    code: 0,
    msg: ''
  }
  field :client_error, type: :hash, default: {
    code: 1, 
    msg: 'params error'
  }
  field :server_error, type: :hash, default: {
    code: 2, 
    msg: 'server exception'
  }

  field :access_token_url, default: 'https://api.weixin.qq.com/cgi-bin/token?'
  field :grant_type, default: 'client_credential'
  field :create_menu_url, default: 'https://api.weixin.qq.com/cgi-bin/menu/create?'
end
