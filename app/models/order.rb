class Order < ApplicationRecord

	belongs_to :recipe


	mount_uploader :order_image, ImagesUploader
end
