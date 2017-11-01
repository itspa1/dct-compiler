Rails.application.routes.draw do

  devise_for :users , :path_prefix => "my"
  root "assignments#index"
  get 'tags/index'
  get 'tags/question_filter'
  resources :users
  resources :assignments
  resources :answers
  get 'home/index'
  get 'home/input'
  get 'home/check_cache'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
