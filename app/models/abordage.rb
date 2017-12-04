class Abordage < ApplicationRecord
  belongs_to :tresor
  belongs_to :pirate
  belongs_to :type_abordage
end
