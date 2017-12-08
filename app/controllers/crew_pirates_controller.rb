class CrewPiratesController < ApplicationController

  before_action :set_crew
  skip_before_action :authenticate_pirate!, only: [:new, :create]

  def new
    @crew_pirate = CrewPirate.new
    authorize @crew_pirate
  end

  def create
    @crew_pirate = CrewPirate.new(pirate: current_pirate, crew: @crew)
    authorize @crew_pirate
    if @crew.prive == true
      if params[:crew_password] == @crew.password
        if @crew_pirate.save
          redirect_to crew_path(@crew)
        else
          render :new
        end
      else
        flash[:alert] = "Essaie encore"
        render :new
      end
    else
      @crew_pirate.save
      redirect_to crew_path(@crew)
    end
  end

  def destroy
    @crew_pirate = CrewPirate.where(pirate_id: current_pirate.id, crew_id: @crew.id)

    authorize @crew_pirate
    @crew_pirate[0].destroy
    redirect_to crews_path
  end


  private

  def set_crew
    @crew = Crew.find(params[:crew_id])
  end

end
