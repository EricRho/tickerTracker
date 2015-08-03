Rails.application.routes.draw do

  get 'welcome/index'

  devise_for :users do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  scope :api do
    resources :stocks, defaults: {format: :json} do
      get :ohlc
    end
    get :derivatives, to: 'derivatives#index'
  end


  unauthenticated :user do
    root :to => 'welcome#index'
  end

  authenticated :user do
    devise_scope :user do
      get '/' => 'my_watch_list#index'
    end
  end
end
