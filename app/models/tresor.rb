class Tresor < ApplicationRecord
  belongs_to :pirate


  has_many :crews

  has_many :abordages, dependent: :destroy
end
