class Pirate < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :tresors
  has_many :abordages
  has_many :crews

  validates :pseudo, uniqueness: true
end
