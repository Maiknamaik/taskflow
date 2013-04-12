class HoboMigration4 < ActiveRecord::Migration
  def self.up
    create_table :project_users do |t|
      t.datetime :created_at
      t.datetime :updated_at
      t.integer  :user_id
      t.integer  :project_id
    end
    add_index :project_users, [:user_id]
    add_index :project_users, [:project_id]

    change_column :tasks, :description, :text, :limit => nil
    change_column :tasks, :utility, :text, :limit => nil
    change_column :tasks, :resources, :text, :limit => nil

    remove_index :workdays, :name => :index_workdays_on_owner_id_id rescue ActiveRecord::StatementInvalid
    add_index :workdays, [:user_id]

    remove_index :users, :name => :index_users_on_project_id rescue ActiveRecord::StatementInvalid
  end

  def self.down
    change_column :tasks, :description, :string
    change_column :tasks, :utility, :string
    change_column :tasks, :resources, :string

    drop_table :project_users

    remove_index :workdays, :name => :index_workdays_on_user_id rescue ActiveRecord::StatementInvalid
    add_index :workdays, [:owner_id_id]

    add_index :users, [:project_id]
  end
end
