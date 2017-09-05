Rails.application.routes.draw do
  root 'lists#index'
  resources :lists do
    resources :destinations
  end

  scope 'destinations/:destination_id', as: 'destination' do
    resources :activities
  end

end
