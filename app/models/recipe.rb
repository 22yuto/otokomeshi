class Recipe < ApplicationRecord

	attachment :image

	belongs_to :user
	has_many :comments, dependent: :destroy

	has_many :orders
	accepts_nested_attributes_for :orders, allow_destroy: true

	is_impressionable

	has_many :favorites

	has_many :likes, dependent: :destroy

	def like_user(user_id)
		likes.find_by(user_id: user_id)
	end

	def favorited_by?(user)
        favorites.where(user_id: user.id).exists?
    end
    
end
