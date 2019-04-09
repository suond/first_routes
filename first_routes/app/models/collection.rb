# == Schema Information
#
# Table name: collections
#
#  id              :bigint(8)        not null, primary key
#  user_id         :integer          not null
#  artwork_id      :integer          not null
#  collection_name :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#


class Collection < ApplicationRecord

    belongs_to :user,
    foreign_key: :user_id,
    class_name: :User

    belongs_to :artwork,
    foreign_key: :artwork_id,
    class_name: :Artwork

    def self.collections(user_id)
        Collection.where("user_id = #{user_id}")
    end
end
