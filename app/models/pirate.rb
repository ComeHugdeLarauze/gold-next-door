class Pirate < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :crew_pirates
  has_many :crews, through: :crew_pirates

  has_many :tresors
  has_many :abordages

  mount_uploader :photo, AvatarUploader

  validates :pseudo, uniqueness: true, presence: true, format: { without: /\s/ }
end
