class Tresor < ApplicationRecord
  belongs_to :pirate

  has_many :crew_tresors
  has_many :tresors, through: :crew_tresors
  has_many :abordages, dependent: :destroy
  has_many :crews
  mount_uploader :photo, PhotoUploader


  def self.count_by_type(tresor)
    Abordage.where(tresor: tresor).group(:type_abordage_id).count
  end
end
