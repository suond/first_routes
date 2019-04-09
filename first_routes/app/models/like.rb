# == Schema Information
#
# Table name: likes
#
#  id            :bigint(8)        not null, primary key
#  user_id       :integer          not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  likeable_id   :integer
#  likeable_type :string
#

class Like < ApplicationRecord
    validates :user_id, presence: true

    belongs_to :user,
    foreign_key: :user_id,
    class_name: :User
    
    belongs_to :likeable,
    polymorphic: true
    

    
    



end
