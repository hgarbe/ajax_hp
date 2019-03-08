Rails.application.routes.draw do
  root "hps#book"

  get "hp_form", to: "hps#form"

  resources :hps do
    resources :characters
  end
end
