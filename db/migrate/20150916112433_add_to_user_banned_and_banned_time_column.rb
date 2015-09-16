class AddToUserBannedAndBannedTimeColumn < ActiveRecord::Migration
  def change
  	remove_column :users, :banned, :integer
  	add_column :users, :banned, :boolean, default: false
  	add_column :users, :banned_time, :date
  end
end
