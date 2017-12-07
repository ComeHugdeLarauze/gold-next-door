class CrewPiratesController < ApplicationController
  before_action :set_crew
  skip_before_action :authenticate_pirate!, only: [:new, :create, :destroy]

  def new
    @crew_pirate = CrewPirate.new
    authorize @crew_pirate
  end

  def create
    @crew_pirate = CrewPirate.new(pirate: current_pirate, crew: @crew)
    authorize @crew_pirate

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
  end

  def destroy
    redirect_to crews_path
  end


  private

  def set_crew
    @crew = Crew.find(params[:crew_id])
  end
end
