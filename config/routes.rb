Rails.application.routes.draw do
  root "feedbacks#new"
  resources :feedbacks, except: [:edit, :update]
  get '/my_feedbacks/:token' => "feedbacks#show_by_token", as: "feedbacks_with_token"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
