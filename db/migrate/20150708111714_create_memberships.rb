class CreateMemberships < ActiveRecord::Migration
  def change
    create_table :memberships do |t|
      t.references :user, index: true
      t.references :team, index:true

      t.timestamps null: false
    end
  end
end
