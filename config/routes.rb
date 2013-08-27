Catering::Application.routes.draw do
  get "content/silver"

  get "content/gold"

  get "content/platinum"

  root :to => "home#index"
  devise_for :users, :controllers => { :registrations => 'registrations' }

end
