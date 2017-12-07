class Tresor < ApplicationRecord
  belongs_to :pirate

  has_many :crew_tresors, dependent: :destroy
  has_many :crews, through: :crew_tresors

  has_many :abordages, dependent: :destroy
  mount_uploader :photo, PhotoUploader


  validates :titre, presence: true
  validates :photo, presence: true
  validates :description, presence: true
end
