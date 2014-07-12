class Addtokensecretandpicture < ActiveRecord::Migration
  def change
  	add_column :users, :picture, :string
  	add_column :authentications, :token, :string
  	add_column :authentications, :secret, :string
  end
end
