class CreateSchools < ActiveRecord::Migration
  def change
    create_table :schools do |t|
      t.string :name
      t.boolean :private, default: false
      t.string :level
      t.string :mascot
      t.string :street
      t.string :city
      t.string :province
      t.string :postal_code

      t.timestamps null: false
    end
  end
end
