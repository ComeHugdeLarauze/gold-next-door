class PagesController < ApplicationController
  skip_before_action :authenticate_pirate!, only: [:home, :index]

  def home
  end
  def index

  end
end
