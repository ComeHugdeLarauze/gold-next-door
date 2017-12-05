class AbordagesController < ApplicationController
  def index
    @abordages_participant = current_pirate.abordages
    @abordages_author = Abordage.where(tresor: current_pirate.tresors)
  end

  def new
  end

  def create
    pimped_params =  abordage_params
    pimped_params["type_abordage_id"] = pimped_params["type_abordage_id"].to_i
    @abordage = Abordage.new(pimped_params)
    @abordage.pirate = current_pirate
    @abordage.tresor = Tresor.find(params[:tresor_id])
    if @abordage.save
      redirect_to tresor_path(@abordage.tresor)
    else
    end
  end

  private

  def set_abordage
    @abordage = Abordage.find(params[:id])
  end

  def abordage_params
    params.require(:abordage).permit(:message, :quantite, :type_abordage_id)
  end
end
