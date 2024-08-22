class Bookmark < ApplicationRecord
  validates :comment, length: { minimum: 6 }
  validates :movie_id, presence: true
  validates :list_id, presence: true
  belongs_to :movie
  belongs_to :list
  validates :list, uniqueness: { scope: :movie, message: "Unique movie in the list" }
  has_one_attached :photo
end
