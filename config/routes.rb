Rails.application.routes.draw do
  namespace :front, path: "/" do
    get "/app(/*other)", to: "app#index"
  end
end
