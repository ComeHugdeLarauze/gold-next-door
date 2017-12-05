class Tresor < ApplicationRecord
  belongs_to :pirate

  mount_uploader :photo, PhotoUploader
  has_many :abordages, dependent: :destroy

end
