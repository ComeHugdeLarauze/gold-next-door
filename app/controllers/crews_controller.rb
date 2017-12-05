class CrewsController < ApplicationController
CRUD
  before_action :set_crew, only: [:show, :edit, :update]

  def index
    @crews = policy_scope(Crew).order(created_at: :desc)
  end

  def show
    authorize @crew
  end

  def new
    @crew = Crew.new
    authorize @crew
  end

  def create
    @crew = Crew.new(crew_params)
    @crew.pirate_id = current_pirate.id
    authorize @crew
    if @crew.save
      current_pirate.credits
      redirect_to crews_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    @crew.update(crew_params)
    redirect_to crew_path(@crew)
  end

  def destroy
    @crew.destroy
    redirect_to crews_path
  end

  private
  def crew_params
    params.require(:crew).permit(:nom, :prive, :password)
  end

  def set_crew
    @crew = Crew.find(params[:id])
  end


end
