Rails.application.routes.draw do

  devise_for :users
  get 'home/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "home#index"

  resources :postings do
    member do
      put "like", to:    "postings#upvote"
      put "unlike", to:    "postings#downvote"
   end
end
  mount Commontator::Engine => '/commontator'
end
