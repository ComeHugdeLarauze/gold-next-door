class CrewsController < ApplicationController
# CRUD
  before_action :set_crew, only: [:show, :edit, :update]

  def index
    @crews = Crew.all
  end

  def show
    # authorize @crew
  end

  def new
    @crew = Crew.new
    # authorize @crew
  end

  def create
    @crew = Crew.new(crew_params)
    @crew.pirates.push(current_pirate)
    # @crewpirate = CrewPirate.new(pirate_id: current_pirate.id, crew_id: @crew.id )
    @crew.pirate_id = current_pirate.id
    # authorize @crew
    if @crew.save
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
