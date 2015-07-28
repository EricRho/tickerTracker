Rails.application.routes.draw do

  devise_for :users,
  :controllers => {
    :omniauth_callbacks => 'users/omniauth_callbacks'
  }

  scope :api do
    resources :stocks, defaults: {format: :json} do
      get :ohlc
    end
    get :derivatives, to: 'derivatives#index'
  end
  root 'my_watch_list#index'
end
