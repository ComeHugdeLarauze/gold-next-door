class CrewsController < ApplicationController
# CRUD
  before_action :set_crew, only: [:show, :edit]

  def index
    @crews = Crew.all
  end

  def show
  end

  def new

    @crew = Crew.new
    # authorize @crew
  end

  def create
    @crew = Crew.new(crew_params)
    # authorize @crew
    if @crew.save
      @crewpirate = CrewPirate.create(pirate_id: current_pirate.id, crew_id: @crew.id)
      redirect_to crew_path(@crew)
    else
      render :new
    end
  end

  def edit
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
    # authorize @crew
  end
end
