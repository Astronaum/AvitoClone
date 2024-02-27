Rails.application.routes.draw do

  root "pages#home"
  get "/autoneuf", to: "pages#autoneuf"
  get "/immoneuf", to: "pages#immoneuf"
  get "/simulateur", to: "pages#simulateur"
  get "/boutique", to: "pages#boutique"
  get "/magazine", to: "pages#magazine"
  get "/aide", to: "pages#aide"
  get "/connexion", to: "pages#connexion"
  get "/depotAnnonce", to: "pages#depotAnnonce"
  get "/mesannonces", to: "annonces#mesannonces"
  get '/search', to: 'annonces#search', as: 'search'

  resources :utilisateurs

  get 'signup' => 'utilisateurs#new'
  post 'signup' => 'utilisateurs#create'

  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  get 'logout' => 'sessions#destroy'

  get 'edit' => 'utilisateurs#edit'
  get 'annonces/:id/edit', to: 'annonces#edit', as: 'edit_annonce'

  get 'mesfavoris' => 'favoris#mesfavoris'

  resources :annonces
  resources :favoris


end
