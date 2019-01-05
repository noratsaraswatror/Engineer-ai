Rails.application.routes.draw do
  root 'home#index'
  get 'secret_code/index'
  post '/generate_secret_codes' => 'secret_code#generate_secret_codes'
  devise_for :users, :skip => [:registrations,:sessions]
  devise_for :users, controllers: { registrations: "registrations" }
end
