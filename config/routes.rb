Rails.application.routes.draw do

  namespace :v1 do
    resources :dog_walkings, only: [:show, :create] do
      get  '(:filter)', to: 'dog_walkings#index', on: :collection
      post 'start_walk', to: 'dog_walkings#start_walk'
      post 'finish_walk', to: 'dog_walkings#finish_walk'
    end
  end
end
