class PagesController < ApplicationController
  skip_before_action :authenticate_pirate!, only: [:home]

  def home
  end
end
