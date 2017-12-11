class PiratesController < ApplicationController
before_action :set_pirate, only: [:show, :edit, :update, :destroy]

  def index
    @pirates = pirate.all
  end

  def show

  end

  def new
    @pirate = Pirate.new
  end

  def create
    @pirate = Pirate.new(pirate_params)
    if @pirate.save
      redirect_to pirate_path(@pirate)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @pirate.update(pirate_params)
    redirect_to pirate_path(@pirate)
  end

  def destroy
    @pirate.destroy
    redirect_to pirates_path
  end

  private
  def pirate_params
    params.require(:pirate).permit(:pseudo, :email)
  end

  def set_pirate
    @pirate = pirate.find(params[:id])
  end
end
