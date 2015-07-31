Rails.application.routes.draw do
  root 'questions#index'
  resources :users
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#delete'
  resources :questions do
    resources :answers, only: [:create]
    resources :comments, only: [:create]
    resources :votes, only: [:create]
  end
  resources :answers, only: [] do
    resources :comments, only: [:create]
    resources :votes, only: [:create]
  end
  resources :tags, only: [:index, :show]

end
