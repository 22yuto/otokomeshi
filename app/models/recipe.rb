class Recipe < ApplicationRecord

	attachment :image

	belongs_to :user

	has_many :orders
	accepts_nested_attributes_for :orders, allow_destroy: true
end
