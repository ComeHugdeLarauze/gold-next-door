class AbordagesController < ApplicationController
  before_action :set_abordage, only: [:create]

  def index
    @abordages_participant = current_pirate.abordages
    @abordages_author = Abordage.where(tresor: current_pirate.tresors)
  end

  def new
  end

  def create
    @abordage.new(abordage_params)
    @abordage.user = current_user
    @abordage.tresor = Tresor.find(params[tresor_id])
    if @abordage.save
      redirect_to tresors_path(@abordage.tresor)
    else
    end
  end

  private

  def set_abordage
    @abordage = Abordage.find(params[id])
  end

  def abordage_params
    params.require(:abordage).permit(:abordage_type_id)
  end
end
