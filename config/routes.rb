Rails.application.routes.draw do
  get 'notifications/link_through'
  get 'tops/top'
  get 'tops/about'
  devise_for :admins, controllers: {
  sessions:      'admins/sessions',
  passwords:     'admins/passwords',
  registrations: 'admins/registrations'
}
  devise_for :users, controllers: {
  sessions:      'users/sessions',
  passwords:     'users/passwords',
  registrations: 'users/registrations'
}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:create, :show, :edit, :update, :destroy, :index]
  resources :admin_users, only: [:show, :index, :update, :destroy]
  resources :messages, only: [:create, :destroy]
  resources :entries, only: [:create]
  resources :rooms, only: [:create, :show, :index]
  resources :ideas do
  	resource :idea_favorites, only: [:create,:destroy]
  	resource :idea_comments, only: [:create,:destroy]
    resources :works,only: [:new,:edit,:update,:destroy,:create,:show] do
    resource :work_favorites, only: [:create,:destroy]
    resource :work_comments, only: [:create,:destroy]
  end
  end
  get  "/works" => "works#index"
  get 'notifications/:id/link_through', to: 'notifications#link_through',
  as: :link_through
  get 'notifications', to: 'notifications#index'

  get 'messagenotifications/:id/message_link_through', to: 'messagenotifications#message_link_through',
  as: :message_link_through

  get "/about" => "top#about"
  root "tops#top"
end