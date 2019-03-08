class HpsController < ApplicationController
  before_action :set_hp, except: [:index, :create, :form]

  def index
    @hps = Hp.all
  end

  def show
  end

  def form
    @hp = Hp.new
    render partial: "form"
  end

  def create
    @hp = Hp.new(hp_params)
    if @hp.save
      render json: @hp
    else
      render_error(@hp)
    end
  end

  def update
    if @hp.update(hp_params)
      render json: @hp
    else
      render_error(@hp)
    end
  end

  def destroy
    @hp.destroy
    render json: { message: "Removed" }, status: :ok
  end

  private
    def set_hp
      @hp = Hp.find(params[:id])
    end

    def hp_params
      params.require(:hp).permit(:book, :house)
    end
end
