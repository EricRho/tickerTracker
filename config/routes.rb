Rails.application.routes.draw do

  scope :api do
    resources :stocks, defaults: {format: :json}
    get :derivatives, to: 'derivatives#index'
  end

  root 'my_watch_list#index'

end
