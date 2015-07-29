Rails.application.routes.draw do

  get 'welcome/index'

  devise_for :users,
  :controllers => {
    :omniauth_callbacks => 'users/omniauth_callbacks'
  }

  devise_scope :user do
    get '/api/current_user' => 'users/sessions#show_current_user', as: 'show_current_user'
    post '/api/check/is_user' => 'users/users#is_user', as: 'is_user'
  end

  # devise_scope :user do
  #   get '/api/current_user' => 'users/sessions#show_current_user'
  #   post '/api/check/is_user' => 'users/users#is_user', as: 'is_user'
  # end

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
