Rails.application.routes.draw do
  devise_for :admins, skip: [:passwords], controllers: {
  registrations: "admin/registrations",
  sessions: 'admin/sessions'
}
  devise_for :members, skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

  namespace :public do
    get "top" => "homes#top", as: "top"
    resources :posts, except: [:destroy]
    resources :gyms, only: [:index, :show]
  end

  scope module: :admin do
    resources :admins, only: [:edit, :update, :show]
    resources :machines, only: [:index, :create, :edit, :update, :show]
    resources :sites, only: [:new, :create, :destroy]
  end
  root to: "public/homes#about"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end