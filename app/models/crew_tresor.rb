class CrewTresor < ApplicationRecord
  belongs_to :tresor
  belongs_to :crew
end
