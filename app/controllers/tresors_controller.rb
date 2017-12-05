class TresorsController < ApplicationController
  before_action :set_tresor, only: [:show, :destroy]

  def index
    @tresors = Tresor.all
  end

  def show
    @abordage = Abordage.new
  end

  def new
    @tresor = Tresor.new
  end

  def create
    @tresor = Tresor.new(tresor_params)
    @tresor.pirate = current_pirate
    if @tresor.save
      redirect_to tresor_path(@tresor)
    else
      render :new
    end
  end

  def destroy
    @tresor.destroy
    redirect_to root_path
  end

  private

  def set_tresor
    @tresor = Tresor.find(params[:id])
  end

  def tresor_params
    params.require(:tresor).permit(:titre, :description, :indice, :photo, :photo_cache)
  end
end
