redis_conf = Hashie::Mash.new(Rails.application.config_for(:redis))
password = redis_conf.password.nil? ? '' : ':' + redis_conf.password
redis_url = "redis://#{password}@#{redis_conf.host}:#{redis_conf.port}/#{redis_conf.db}"
$redis = Redis.new(url: redis_url)