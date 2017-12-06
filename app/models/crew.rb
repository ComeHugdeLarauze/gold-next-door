class Crew < ApplicationRecord
  has_many :crew_pirates
  has_many :crew_tresors
  has_many :pirates, through: :crew_pirates
  has_many :tresor, through: :crew_tresors

  validates :nom, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 4 }
end
