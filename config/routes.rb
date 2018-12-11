Rails.application.routes.draw do
  resources :resumes
  root 'welcome#index'


  namespace :api do
    resources :resumes, only: [:index]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
