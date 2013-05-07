class HoboMigration10 < ActiveRecord::Migration
  def self.up
    remove_column :workdays, :project_id
  end

  def self.down
    add_column :workdays, :project_id, :integer
  end
end
