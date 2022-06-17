Rails.application.routes.draw do
  
  devise_for :users, controllers: {registrations: 'users/registrations', sessions: 'users/sessions'}
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_scope :user do
    post '/step2' => 'users/registrations#step2'
    post '/step3' => 'users/registrations#step3'
  end
  root "welcomes#new"
  get '/user' => 'welcomes#index'
end
