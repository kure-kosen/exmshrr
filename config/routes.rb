Rails.application.routes.draw do
  devise_for :users

  namespace :api do
    resources :exams, only: %i[index show create]

    namespace :exams do
      resources :search, only: :index
    end
  end

  namespace :front, path: "/" do
    root to: redirect("/app")
    get "/app(/*other)", to: "app#index"
  end
end
