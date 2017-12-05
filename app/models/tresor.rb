class Tresor < ApplicationRecord
  belongs_to :pirate
  has_many :abordages, dependent: :destroy

end
