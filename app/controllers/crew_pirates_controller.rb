class CrewPiratesController < ApplicationController
  before_action :set_crew

  def new
    @crew_pirate = CrewPirate.new
    #authorize @crew_pirate
  end

  def create
    @crew_pirate = CrewPirate.new(pirate: current_pirate, crew: @crew)
    if params[:crew_password] == @crew.password
      #authorize @crew_pirate
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
    binding.pry
    redirect_to crews_path
  end


  private

  def set_crew
    @crew = Crew.find(params[:crew_id])
  end
end
