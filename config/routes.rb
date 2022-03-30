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
    resources :posts, only: [:new, :index, :show, :destroy]
    resources :gyms, only: [:index, :show] do
      member do
        get "machine_index"
      end
    end
    resources :members, only: [:new, :show, :edit, :update]
  end

  scope module: :admin do
    resources :admins, only: [:edit, :update, :show, :index]
    resources :machines, only: [:new, :create, :edit, :update, :show, :index, :destroy]
    resources :sites, only: [:new, :create, :destroy, :index]
  end
  root to: "public/homes#about"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
