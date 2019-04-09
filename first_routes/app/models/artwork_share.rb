# == Schema Information
#
# Table name: artwork_shares
#
#  id         :bigint(8)        not null, primary key
#  artwork_id :integer          not null
#  viewer_id  :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  favorited  :boolean          default(FALSE)
#

class ArtworkShare < ApplicationRecord

    validates :artwork_id, :viewer_id, presence: true
    validates :viewer_id, uniqueness: {scope: :artwork_id, message: "viewer can only view the same artwork once"}
     
    belongs_to :artwork,
    foreign_key: :artwork_id,
    class_name: :Artwork
    
    belongs_to :viewer,
    foreign_key: :viewer_id,
    class_name: :User

    def self.favorites(user_id)
        ArtworkShare.where(viewer_id: user_id).where(favorited: true)
    end
    

end
