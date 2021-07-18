Rails.application.routes.draw do
 devise_for :admins, controllers: {
  sessions:      'admins/sessions',
  passwords:     'admins/passwords',
  registrations: 'admins/registrations'
}
devise_for :customers, controllers: {
  sessions:      'customers/sessions',
  passwords:     'customers/passwords',
  registrations: 'customers/registrations'
}

 root to: 'customer/homes#top'

 namespace :admin do
  resources :genres, only:[:index, :new, :create, :update, :destroy]
  resources :notifications, only: [:index]
  resources :customers do
   patch 'withdrawal'
  end
 end

 namespace :customer do
   resources :genres, only:[:index, :create, :new] do
    resources :categories do
     resources :posts do
      resource :favorites, only: [:create, :destroy]
      resources :comments, only: [:create, :destroy]
     end
    end
   end

   get 'reports/:post_id' => 'posts#report', as: 'report'

   resources :customers do
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
    patch 'withdrawal'
  end
  get 'about' => 'homes#about'
  resources :notifications, only: [:index]
  get 'search' => 'searches#search'
  get 'tag_search' => 'searches#tag_search'
end

end
