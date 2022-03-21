Rails.application.routes.draw do
  devise_for :admins, skip: [:passwords], controllers: {
  registrations: "admin/registrations",
  sessions: 'admin/sessions'
}

  devise_for :members, skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}
  namespace :admin do
    get "top" => "homes#top", as: "top"  
  end

  namespace :public do
    get "top" => "homes#top", as: "top"  
  end
  root to: "public/homes#about"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
