class Tresor < ApplicationRecord
  belongs_to :pirate
  has_many :abordages, dependent: :destroy
  has_many :crews
end
