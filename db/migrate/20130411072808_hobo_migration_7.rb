class HoboMigration7 < ActiveRecord::Migration
  def self.up
    remove_column :workdays, :n_day
  end

  def self.down
    add_column :workdays, :n_day, :integer
  end
end
