class AddPersonIdToContact < ActiveRecord::Migration
  def change
    add_column :contacts, :person_id, :integer
    add_index :contacts, :person_id, unique: true
  end
end
