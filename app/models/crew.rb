class Crew < ApplicationRecord
  has_many :pirates
  has_many :tresors
end
