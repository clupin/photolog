class Score < ActiveRecord::Base
	include PublicActivity::Model
  	tracked owner: ->(controller, model) { controller && controller.current_user }
  	
  belongs_to :user
  belongs_to :post
  validates :value, :inclusion => 1..5
end
