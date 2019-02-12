class Like < ApplicationRecord

	belongs_to :recipe, counter_cache: :likes_count
	# リレーションされているlikeの数の値をリレーション先のlikes_countというカラムの値に入れる

	belongs_to :user
end
