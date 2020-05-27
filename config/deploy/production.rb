set :stage, :production

set :branch, :master
set :rails_env, :production

server '111.229.77.74', user: 'fwj', roles: %w{web app db}


