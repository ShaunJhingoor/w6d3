class User < ApplicationRecord
  has_many :artworks, class_name: :Artwork, foreign_key: "artist_id", dependent: :destroy
  has_many :artwork_shares, foreign_key: :viewer_id
  has_many :shared_artworks, through: :artwork_shares, source: :artwork
end
