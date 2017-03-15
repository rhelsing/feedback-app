Rails.application.routes.draw do
  root "feedbacks#new"
  resources :feedbacks
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
