class PracticePlan < ActiveRecord::Base
	belongs_to :team
	has_many :periods
	default_scope -> { order(date: :asc) }
	validates :team_id, presence: true
end
