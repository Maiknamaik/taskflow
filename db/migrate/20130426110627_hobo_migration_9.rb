class HoboMigration9 < ActiveRecord::Migration
  def self.up
    add_column :users, :project_id, :integer

    remove_index :workdays, :name => :index_workdays_on_project_id rescue ActiveRecord::StatementInvalid

    add_index :users, [:project_id]
  end

  def self.down
    remove_column :users, :project_id

    add_index :workdays, [:project_id]

    remove_index :users, :name => :index_users_on_project_id rescue ActiveRecord::StatementInvalid
  end
end
