class PracticePlan < ActiveRecord::Base
	belongs_to :user
	has_many :periods
	default_scope -> { order(date: :asc) }
	validates :user_id, presence: true
end
