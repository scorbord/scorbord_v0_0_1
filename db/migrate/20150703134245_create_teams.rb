class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :gender
      t.string :sport
      t.string :competition_level
      t.references :school, index: true

      t.timestamps null: false
    end
    add_foreign_key :teams, :school_id
  end
end
