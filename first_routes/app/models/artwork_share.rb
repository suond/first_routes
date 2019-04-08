class ArtworkShare < ApplicationRecord

    validates :artwork_id, :viewer_id, presence: true
    validates :viewer_id, uniqueness: {scope: :artwork_id, message: "viewer can only view the same artwork once"}
     
    belongs_to :artwork,
    foreign_key: :artwork_id,
    class_name: :Artwork
    
    belongs_to :viewer,
    foreign_key: :viewer_id,
    class_name: :User

    

end