Rails.application.routes.draw do
  # Other routes
  root 'home#index'
  namespace :api do
    namespace :v1 do
      get 'greetings/random', to: 'greetings#random'
    end
  end
end
