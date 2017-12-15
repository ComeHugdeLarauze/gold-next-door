class TresorsController < ApplicationController
  before_action :set_tresor, only: [:show, :destroy]
  skip_before_action :authenticate_pirate!, only: [:home, :index, :create]
  skip_after_action :verify_authorized, only: [:index]
  skip_after_action :verify_policy_scoped, only: [:index]

  def index
    if pirate_signed_in?
      @tresors = Tresor.joins(crew_tresors: :crew).where(crew_tresors: {crew: current_pirate.crews.pluck(:id)}).distinct.order(created_at: :desc)
    else
      @tresors = policy_scope(Tresor).order(created_at: :desc)
    end
  end

  def show
    @pirate = current_pirate
    @abordage = Abordage.new
    authorize @tresor
  end

  def new
    @tresor = Tresor.new
    authorize @tresor
  end

  def create
    redirect_to crews_path if current_pirate.crews.empty?
    @tresor = Tresor.new(tresor_params)
    @tresor.pirate = current_pirate
    authorize @tresor
    if params[:tresor][:crew_ids] != nil && @tresor.save
      params[:tresor][:crew_ids].each do |crew|
        CrewTresor.create(crew_id: crew, tresor_id: @tresor.id)
      end
      flash[:alert] = nil
      redirect_to tresor_path(@tresor)
    else
      flash[:alert] = "Oups... Ajoute un Crew si tu veux dévoiler un trésor!"
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
