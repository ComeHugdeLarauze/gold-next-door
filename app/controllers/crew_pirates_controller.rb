class CrewPiratesController < ApplicationController
  def create
    @crewToAdd = Crew.find(params[:crew_id])
    @pirateToAdd = Pirate.find(params[:pirate_id])
    @crewpirate = CrewPirate.new(pirate: @pirateToAdd, crew: @crewToAdd)
    if @crewpirate.save?
      redirect_to crew_path(@crewToAdd)
    else
      render :new
    end

  end
end
