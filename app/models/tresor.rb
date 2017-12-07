class Tresor < ApplicationRecord
  belongs_to :pirate

  has_many :crew_tresors
  has_many :crews, through: :crew_tresors

  has_many :abordages, dependent: :destroy
  mount_uploader :photo, PhotoUploader
end
