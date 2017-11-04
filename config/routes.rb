Rails.application.routes.draw do

  devise_for :users , :path_prefix => "my"
  resources :users
  resources :assignments do
    collection do
      get 'recents' # to override assignments_recents action will be recents_assignments
      get 'approved'
      get 'deleted'
      get 'search'
      get 'approval'
      get 'sources'
      get 'approve'
    end
  end

  get 'paranoid/restore'
  get 'paranoid/delete_forever'

  resources :answers do
      collection do
        get 'recents'
      end
  end


  get 'tags/index'
  get 'tags/search'
  get 'tags/questions'

  root "assignments#index"

  get 'tags/question_filter'

  get 'home/index'
  get 'home/input'
  get 'home/check_cache'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
