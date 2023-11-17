class List < ApplicationRecord
  # has_many :movies, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  has_many :movies, through: :bookmarks

  validates :name, uniqueness: true
  validates :name, presence: true
  has_one_attached :picture
end
