class AbordagesController < ApplicationController
  before_action :set_abordage, only: [:update]
  skip_after_action :verify_authorized, only: [:traques, :propositions]
  after_action :verify_policy_scoped, only: [:traques, :propositions]

  def traques
    @abordages = policy_scope(current_pirate.abordages.where.not(type_abordage: nil))
    @tresors = policy_scope(current_pirate.tresors)
  end

  def propositions
    @abordages = policy_scope(current_pirate.abordages.where.not(type_abordage: nil))
    @tresors = policy_scope(current_pirate.tresors).order(created_at: :desc)
  end


  def new
    authorize @abordage
  end

  def create
    @abordage = Abordage.new(abordage_params)
    @abordage.pirate = current_pirate
    @abordage.tresor = Tresor.find(params[:tresor_id])
    @tresor = @abordage.tresor
    authorize @abordage
    if @abordage.save
      respond_to do |format|
        format.html { redirect_to tresor_path(@abordage.tresor) }
        format.js
      end
    else

    end
  end

  def update
    authorize @abordage
    @abordage.tresor.vendu = true
    @abordage.tresor.save
    @abordage.pirate.abordages.each do |a|
      a.accepte = false
      a.save
    end
    @abordage.accepte = true
    @abordage.save
    redirect_to tresor_path(@abordage.tresor)
  end

  private

  def set_abordage
    @abordage = Abordage.find(params[:id])
  end

  def abordage_params
    params.require(:abordage).permit(:message, :quantite, :type_abordage_id)
  end
end
