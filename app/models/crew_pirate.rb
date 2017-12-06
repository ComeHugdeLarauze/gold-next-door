class CrewPirate < ApplicationRecord
  belongs_to :crew
  belongs_to :pirate

  validates_uniqueness_of :pirate,  scope: [:crew]
end
