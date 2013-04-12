class HoboMigration5 < ActiveRecord::Migration
  def self.up
    remove_column :workdays, :owner_id_id

    remove_column :users, :project_id
  end

  def self.down
    add_column :workdays, :owner_id_id, :integer

    add_column :users, :project_id, :integer
  end
end
