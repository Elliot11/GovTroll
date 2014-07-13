class AddPersonIdToTarget < ActiveRecord::Migration
  def change
    add_column :targets, :person_id, :integer, null: false
  end
end