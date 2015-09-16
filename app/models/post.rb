class Post < ActiveRecord::Base
	belongs_to :user
	has_many :comments
	has_many :scores
	validates :title, presence: true, length: { maximum: 50 }
	validates :body, presence: true, length: { maximum: 2000 }
	validates :cover, presence: true
	before_create :set_visits_count

	has_attached_file :cover, styles: { medium: "1280x720", thumb: "600x400", mini: "140x140" }
	validates_attachment_content_type :cover, content_type: /\Aimage\/.*\Z/

	def update_visits_count
		self.update(visits_count: self.visits_count+1)
	end





	private

	def set_visits_count
		self.visits_count = 0
	end
end
