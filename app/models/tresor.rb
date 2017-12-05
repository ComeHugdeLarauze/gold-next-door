class Tresor < ApplicationRecord
  belongs_to :pirate
  mount_uploader :photo, PhotoUploader
end
