Rails.application.routes.draw do

  root      'places#index'

  get       '/places/new' => 'places#new'
  post      '/places' => 'places#create'

  get       '/places' => 'places#index'  
  get       '/places/:id' => 'places#show', :as => 'place'

  get       '/places/:id/edit' => 'places#edit', :as => 'edit_place'
  patch     '/places/:id' => 'places#update'

  delete    '/places/:id' => 'places#destroy'

end
