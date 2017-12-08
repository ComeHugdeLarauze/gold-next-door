class Tresor < ApplicationRecord
  belongs_to :pirate

  has_many :crew_tresors, dependent: :destroy
  has_many :crews, through: :crew_tresors

  has_many :abordages, dependent: :destroy
  mount_uploader :photo, PhotoUploader

  has_one :vente, -> { where(accepte: true) }, class_name: 'Abordage'


  validates :titre, presence: true
  validates :photo, presence: true
  validates :description, presence: true

  def self.count_by_type(tresor)
    Abordage.where(tresor: tresor).group(:type_abordage_id).count
  end
end
