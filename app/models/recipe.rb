class Recipe < ApplicationRecord

	attachment :image

	validates :title, presence: true

	belongs_to :user
	has_many :comments, dependent: :destroy

	has_many :orders, dependent: :destroy
	accepts_nested_attributes_for :orders, allow_destroy: true

	is_impressionable counter_cache: true

	has_many :favorites, dependent: :destroy

	has_many :likes, dependent: :destroy

# タグ
	acts_as_taggable_on :labels
	acts_as_taggable
	acts_as_ordered_taggable_on :categories

	def like_user(user_id)
		likes.find_by(user_id: user_id)
	end

	def favorited_by?(user)
        favorites.where(user_id: user.id).exists?
    end
    
end
