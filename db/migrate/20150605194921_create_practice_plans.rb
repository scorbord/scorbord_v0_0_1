class CreatePracticePlans < ActiveRecord::Migration
  def change
    create_table :practice_plans do |t|
      t.string :description
      t.date :date
      t.time :start_time
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
    add_index :practice_plans, [:user_id, :created_at]
  end
end
