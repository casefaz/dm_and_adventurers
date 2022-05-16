Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/dungeon_masters', to: 'dungeon_masters#index'
  get '/dungeon_masters/new', to: 'dungeon_masters#new'
  get '/dungeon_masters/:id', to: 'dungeon_masters#show'

  get '/player_characters', to: 'player_characters#index'
  get '/player_characters/:id', to: 'player_characters#show'

  get '/dungeon_masters/:dungeon_master_id/player_characters', to: 'dungeon_master_player_characters#index'

  post '/dungeon_masters', to: 'dungeon_masters#create'

  get '/dungeon_masters/:id/edit', to: 'dungeon_masters#edit'
  patch '/dungeon_masters/:id', to: 'dungeon_masters#update'

  get '/dungeon_masters/:dungeon_master_id/player_characters/new', to: 'dungeon_master_player_characters#new'
  post '/dungeon_masters/:dungeon_master_id/player_characters/', to: 'dungeon_master_player_characters#create'

  get '/player_characters/:player_character_id/edit', to: 'player_characters#edit'
  patch '/player_characters/:player_character_id', to: 'player_characters#update'

  delete "/dungeon_masters/:id", to: 'dungeon_masters#destroy'

end
