Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get :ping, to: 'application#ping'
      get :signature, to: 'public#signature'
    end
  end
end
