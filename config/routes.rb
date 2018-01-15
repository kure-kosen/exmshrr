Rails.application.routes.draw do
  devise_for :users
  root to: "exams#index"

  namespace :front, path: "/" do
    get "/app(/*other)", to: "app#index"
  end
end
