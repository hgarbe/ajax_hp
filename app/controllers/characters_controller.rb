class CharactersController < ApplicationController
  before_action :set_hp
  before_action :set_character, except: [:index, :create]

  def index
    render json: @hp.characters
  end

  def show
    render json: @character
  end

  def create
    @character = @hp.characters.new(character_params)
    if @character.save
      render json: @character
    else
      render_error(@character)
    end
  end

  def update
    if @character.update(character_params)
      render json: @character
    else
      render_error(@character)
    end
  end

  def destroy
    @character.destroy
    render json: { message: "Removed" }, status: :ok
  end

  private
    def set_hp
      @hp = Hp.find(params[:hp_id])
    end

    def set_character
      @character = Character.find(params[:id])
    end

    def character_params
      params.require(:character).permit(:name, :quote)
    end
end
