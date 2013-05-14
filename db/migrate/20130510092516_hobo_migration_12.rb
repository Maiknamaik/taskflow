class HoboMigration12 < ActiveRecord::Migration
  def self.up
    change_column :users, :teacher, :boolean, :default => false
  end

  def self.down
    change_column :users, :teacher, :boolean
  end
end
