class CreatePeriods < ActiveRecord::Migration
  def change
    create_table :periods do |t|
      t.string :description
      t.integer :duration
      t.integer :row_order
      t.references :practice_plan, index: true, foreign_key: true

      t.timestamps null: false
    end
    add_index :periods, [:practice_plan_id, :created_at]
  end
end
