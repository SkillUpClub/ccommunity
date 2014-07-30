Rails.application.routes.draw do

  get 'links/moderate', to: 'links#moderate', :as => 'links_moderate'
  
  devise_for :users # , :controllers => { :registrations => :registrations }
  as :user do
    get 'users/edit' => 'devise/registrations#edit', :as => 'edit_user_registration'
    put 'users' => 'devise/registrations#update', :as => 'user_registration'
  end
  resources :users
  resources :categories
  resources :links do
    member do
      put 'approve', to: 'links#approve'
    end
  end
  resources :posts do
    resources :comments
    member do
      put 'like',    to: 'posts#like'
      put 'dislike', to: 'posts#dislike'
    end
  end

  root 'posts#index'

end
