class PlayerCharactersController < ApplicationController
    def index
        @pc = PlayerCharacter.all
    end
end