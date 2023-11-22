class Artwork < ApplicationRecord
  validates :artist_id, uniqueness: { scope: [:title] }
  validates :image_url, uniqueness: true

  belongs_to :artist, class_name: "User", foreign_key: "artist_id"
  has_many :artwork_shares, dependent: :destroy
  has_many :shared_viewers, through: :artwork_shares, source: :viewer
end
