Rails.application.routes.draw do
  root "practice#index"
  get "up" => "rails/health#show", as: :rails_health_check

  get  "practice", to: "practice#index"
  post "practice/check", to: "practice#check"
end
