class PlayerCharactersController < ApplicationController
    def index
        @pc = PlayerCharacter.all
    end

    def show
        @pc = PlayerCharacter.find(params[:id])
    end
end