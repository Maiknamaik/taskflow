class HoboMigration3 < ActiveRecord::Migration
  def self.up
    add_column :users, :project_id, :integer

    add_index :users, [:project_id]
  end

  def self.down
    remove_column :users, :project_id

    remove_index :users, :name => :index_users_on_project_id rescue ActiveRecord::StatementInvalid
  end
end
