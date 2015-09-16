class Score < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
  validates :value, :inclusion => 1..5
end
