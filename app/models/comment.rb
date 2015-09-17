class Comment < ActiveRecord::Base
	include PublicActivity::Model
  	tracked owner: ->(controller, model) { controller && controller.current_user }
  	
	belongs_to :user
	belongs_to :post
	validates :body, presence: true, length: { maximum: 1000 }
end
