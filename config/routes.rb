Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/dungeon_masters', to: 'dungeon_masters#index'
  get '/dungeon_masters/new', to: 'dungeon_masters#new'
  get '/dungeon_masters/:id', to: 'dungeon_masters#show'

  get '/player_characters', to: 'player_characters#index'
  get '/player_characters/:id', to: 'player_characters#show'

  get '/dungeon_masters/:dungeon_master_id/player_characters', to: 'dungeon_master_player_characters#index'

  post '/dungeon_masters', to: 'dungeon_masters#create'

  get '/dungeon_masters/:dungeon_master_id/edit', to: 'dungeon_masters#edit'
end
