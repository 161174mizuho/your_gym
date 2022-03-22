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

  namespace :admin do
    get "top" => "homes#top", as: "top"
    resources :machines, only: [:index, :create, :edit, :update, :show]
    resources :posts, only: [:index, :show]
  end
  root to: "public/homes#about"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
