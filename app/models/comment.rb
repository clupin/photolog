class Comment < ActiveRecord::Base
	belongs_to :user
	belongs_to :post
	validates :title, presence: true, length: { maximum: 1000 }
end
