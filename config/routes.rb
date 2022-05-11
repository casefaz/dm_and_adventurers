Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/dungeon_masters', to: 'dungeon_masters#index'
  get '/dungeon_masters/:id', to: 'dungeon_masters#show'
end
