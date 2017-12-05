class Tresor < ApplicationRecord
  belongs_to :pirate
  has_many :crews
  has_many :abordages, dependent: :destroy
  has_many :crews
  mount_uploader :photo, PhotoUploader
end
