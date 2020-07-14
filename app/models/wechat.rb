class Wechat
  class << self
    def get_access_token(app_id, app_secret)
      key = token_key(app_id)
      access_token = $redis.get(key)
      return access_token if access_token

      jbody = get_access_token_by_wechat(app_id, app_secret)
      return '' if jbody.empty?
      $redis.set(key, jbody['access_token'], ex: jbody['expires_in'])
      jbody['access_token']
    end

    def get_access_token_by_wechat(app_id, app_secret)
      params = {grant_type: Setting.grant_type, appid: app_id, secret: app_secret}
      url = "#{Setting.access_token_url}#{params.to_param}"
      begin
        body = Net::HTTP.get(URI(url))
        jbody = JSON.parse(body)
        if jbody['errcode'] && jbody['errcode'] != 0
          Rails.logger.warn("get access token fail: #{jbody}")
          return {}
        end
        return jbody
      rescue => e
        Rails.logger.warn("get_access_token_by_wechat exception: #{e.full_message}")
        return {}
      end
    end

    def token_key(app_id)
      "#{app_id}_access_token"
    end


    def create_menu(app_id, app_secret)
      key = token_key(app_id)
      params = {access_token: get_access_token(app_id, app_secret)}
      url = "#{Setting.create_menu_url}#{params.to_param}"
      begin
        res = Net::HTTP.post(URI(url), menu)
        debugger
        a = 1
      rescue => e
        Rails.logger.warn("create_menu exception: #{e.full_message}")
      end
    end

    def menu
      {
        button: [
          {
            name: '产品介绍',
            sub_button: [
              {
                "type": "view",
                "name": "围产期干细胞",
                "url": "http://111.229.77.74:3000/"
              },
              {
                "type": "view",
                "name": "脂肪干细胞",
                "url": "http://111.229.77.74:3000/"
              },
              {
                "type": "view",
                "name": "免疫细胞",
                "url": "http://111.229.77.74:3000/"
              }
            ]
          }
        ]
      }.to_json
    end
  end
end