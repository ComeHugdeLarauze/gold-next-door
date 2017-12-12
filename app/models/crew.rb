class Crew < ApplicationRecord
  has_many :crew_pirates
  has_many :crew_tresors
  has_many :pirates, through: :crew_pirates
  has_many :tresor, through: :crew_tresors

  validates :nom, presence: true, uniqueness: true

  # STATUSES = ["Public", "Privé"]
  # validates :status, inclusion: {in: STATUSES}

  def nice_nom
    "##{nom}"
  end

end
