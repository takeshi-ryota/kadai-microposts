class Micropost < ApplicationRecord
  belongs_to :user
  
  validates :user_id,presence:true
  validates :content,presence:true,length:{maximum: 255}
  
  has_many :likes
  has_many :reverses_of_liking,class_name: 'Like',foreign_key: 'like_id'
  has_many :likeusers,through: :reverses_of_liking,source: :user
end
