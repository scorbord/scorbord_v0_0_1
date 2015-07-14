class Team < ActiveRecord::Base
  belongs_to :school
  validates :competition_level, uniqueness: { scope: [:school_id, :sport, :gender]}
  has_many :practice_plans
  has_many :memberships
  has_many :users, through: :memberships
end
