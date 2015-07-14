class AddInitialsToSchool < ActiveRecord::Migration
  def change
  	add_column :schools, :initials, :string
  end
end
