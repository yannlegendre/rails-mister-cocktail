class Cocktail < ApplicationRecord
  has_many :doses, dependent: :destroy
  has_many :ingredients, through: :doses

  validates :name, uniqueness: true, presence: true
  # before_destroy :check_for_ingredient

  mount_uploader :photo, PhotoUploader
  validates :photo, presence: true

end
