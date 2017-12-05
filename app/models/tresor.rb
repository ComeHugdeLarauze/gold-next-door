class Tresor < ApplicationRecord
  belongs_to :pirate

  has_many :crews
end
