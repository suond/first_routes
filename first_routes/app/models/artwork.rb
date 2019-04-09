# == Schema Information
#
# Table name: artworks
#
#  id         :bigint(8)        not null, primary key
#  title      :string           not null
#  image_url  :string           not null
#  artist_id  :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  favorited  :boolean          default(FALSE)
#

class Artwork < ApplicationRecord
    validates :artist_id, :title, :image_url, presence: true

    belongs_to :artist,
    foreign_key: :artist_id,
    class_name: :User

    has_many :artwork_shares,
    foreign_key: :artwork_id,
    class_name: :ArtworkShare

    has_many :shared_viewers,
    through: :artwork_shares,
    source: :viewer

    has_many :comments,
    foreign_key: :artwork_id,
    class_name: :Comment,
    dependent: :destroy

    has_many :collections,
    foreign_key: :artwork_id,
    class_name: :Collections

    has_many :likes, as: :likeable

    def self.favorites(user_id)
        Artwork.where(favorited: true).where("#{:artist_id} = #{user_id}")
    end
end
