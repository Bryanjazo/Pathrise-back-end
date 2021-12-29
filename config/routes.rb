Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :job_sources

    end
  end
  namespace :api do
    namespace :v1 do
      resources :job_opportunities
    end
  end
  namespace :api do
    namespace :v1 do
      resources :job_boards
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
