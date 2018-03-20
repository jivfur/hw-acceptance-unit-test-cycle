Rottenpotatoes::Application.routes.draw do
  resources :movies
  #get '/movies/:id/samedirector' => 'movies#samedirector', :as=>'samedirector'
  # map '/' to be a redirect to '/movies'
  root :to => redirect('/movies')
  
  match '/movies/:id/samedirector', to: 'movies#samedirector', as: 'samedirector', via: :get
end
