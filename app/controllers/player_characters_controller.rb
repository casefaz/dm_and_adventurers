class PlayerCharactersController < ApplicationController
    def index
        @pc = PlayerCharacter.dead_or_alive
    end

    def show
        @pc = PlayerCharacter.find(params[:id])
    end

    def edit
        # @pc = PlayerCharacter.find(params[:player_character_id])
        @pc_id = params[:player_character_id]
    end

    def update
        pc = PlayerCharacter.find(params[:player_character_id])
        pc.update(pc_params)
        redirect_to "/player_characters/#{pc.id}"
    end

    def destroy
        pc = PlayerCharacter.find(params[:id])
        pc.destroy
        redirect_to '/player_characters'
    end

    def pc_params
        params.permit(:player_name, :character_name, :character_age, :character_level, :character_class, :character_race, :is_alive)
    end
end