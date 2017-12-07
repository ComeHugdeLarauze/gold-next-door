class Abordage < ApplicationRecord
  belongs_to :tresor
  belongs_to :pirate
  belongs_to :type_abordage, optional: true

  validates_presence_of :tresor
  validates_presence_of :pirate
  validates_presence_of :message, if: :abordage_is_troll?
  validates_presence_of :quantite, scope: :type_abordage, unless: :abordage_is_troll?


  private

  def abordage_is_troll?
    quantite.nil? || type_abordage.nil?
  end
end
