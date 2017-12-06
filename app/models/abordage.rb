class Abordage < ApplicationRecord
  belongs_to :tresor
  belongs_to :pirate
  belongs_to :type_abordage, optional: true

  validates_presence_of :message
  validates_presence_of :tresor
  validates_presence_of :pirate
end
