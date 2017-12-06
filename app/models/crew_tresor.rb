class CrewTresor < ApplicationRecord
  belongs_to :crew
  belongs_to :tresor

  validates_uniqueness_of :tresor,  scope: [:crew]
end
