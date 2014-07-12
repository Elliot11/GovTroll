class CreateTargets < ActiveRecord::Migration
  def change
    create_table :targets do |t|
      t.integer :post_id
      t.integer :politician_id

      t.timestamps
    end
  end
end
