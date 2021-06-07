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
  resources :genres, only:[:index, :new, :create, :destroy]
 end

 namespace :customer do
  resources :genres, only:[:index]
 end
end
