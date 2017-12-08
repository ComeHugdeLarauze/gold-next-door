class TresorsController < ApplicationController
  before_action :set_tresor, only: [:show, :destroy]
  skip_before_action :authenticate_pirate!, only: [:home, :index]

  def index
    @tresors = policy_scope(Tresor).order(created_at: :desc)
  end

  def show
    @abordage = Abordage.new
    authorize @tresor
  end

  def new
    @tresor = Tresor.new
    authorize @tresor
  end

  def create
    @tresor = Tresor.new(tresor_params)
    @tresor.pirate = current_pirate
    authorize @tresor
    if @tresor.save
      params[:tresor][:crew_ids].each do |crew|
        CrewTresor.create(crew_id: crew, tresor_id: @tresor.id )
      end
      redirect_to tresor_path(@tresor)
    else
      render :new
    end
  end

  def destroy
    authorize @tresor
    @tresor.destroy
    redirect_to tresors_path
  end

  private

  def set_tresor
    @tresor = Tresor.find(params[:id])
  end

  def tresor_params
    params.require(:tresor).permit(:titre, :description, :prive, :indice, :photo, :photo_cache)
  end
end
