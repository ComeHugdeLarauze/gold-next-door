class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def default_url_options
  { host: ENV["HOST"] || "localhost:3000" }
  end

  before_action :authenticate_pirate!
  include Pundit

  after_action :verify_authorized, except: :index, unless: :skip_pundit?
  after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?

    rescue_from Pundit::NotAuthorizedError, with: :pirate_not_authorized
  def pirate_not_authorized
    flash[:alert] = "Haha tu pensais avoir accès...!"
    redirect_to(tresors_path)
  end

  private

  def skip_pundit?
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  end

  def pundit_user
    current_pirate
  end
end
