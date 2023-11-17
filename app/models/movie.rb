class Movie < ApplicationRecord
  has_many :bookmarks

  # validates_presence_of :bookmark_id
  # inverse_of: :children
  # before_destroy :checks

  # inverse_of: :children,
  validates_presence_of :overview
  validates :title, presence: true, uniqueness: true
  # private
  # def checks
  #   not parent # true if orphan
  # end
end
