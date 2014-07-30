Asagao::Application.routes.draw do
  root to: "top#index"
  get "about" => "top#about", as: "about"

  get "lesson/:action(/:name)" => "lesson"

  resources :members do
    collection { get "search" }
  end

  resources :articles

  resource :session, only: [:create, :destroy]

  namespace :admin do
    root to: "top#index"
    resources :members do
      collection { get "search" }
    end
    resources :articles
  end
end
