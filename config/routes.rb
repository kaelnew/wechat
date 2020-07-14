Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get :ping, to: 'application#ping'
      get :signature, to: 'public#signature'
    end
  end

  namespace :bjgwsw do
    get :introduce, to: 'base#introduce'
    get :contact, to: 'base#contact'
    get :coorperate, to: 'base#coorperate'
    get :wcqgxb, to: 'base#wcqgxb'
    get :myxb, to: 'base#myxb'
    get :zfgxb, to: 'base#zfgxb'
    get :cclc, to: 'base#cclc'
  end
end
