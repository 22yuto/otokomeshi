class Recipe < ApplicationRecord

	attachment :image

	belongs_to :user
	has_many :comments, dependent: :destroy

	has_many :orders
	accepts_nested_attributes_for :orders, allow_destroy: true

	has_many :favorites

	def favorited_by?(user)
        favorites.where(user_id: user.id).exists?
    end
    
end
