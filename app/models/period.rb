class Period < ActiveRecord::Base
  include RankedModel

  belongs_to :practice_plan
  ranks :row_order, :with_same => :practice_plan_id
  validates :practice_plan_id, presence: true
end
