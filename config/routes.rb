Rails.application.routes.draw do

  scope :api do
    resources :stocks, defaults: {format: :json} do
      get :ohlc
    end
    get :derivatives, to: 'derivatives#index'
  end
  root 'my_watch_list#index'
end
