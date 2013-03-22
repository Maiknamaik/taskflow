class HoboMigration1 < ActiveRecord::Migration
  def self.up
    add_column :workdays, :owner_id_id, :integer

    remove_index :workdays, :name => :index_workdays_on_user_id rescue ActiveRecord::StatementInvalid
    add_index :workdays, [:owner_id_id]
  end

  def self.down
    remove_column :workdays, :owner_id_id

    remove_index :workdays, :name => :index_workdays_on_owner_id_id rescue ActiveRecord::StatementInvalid
    add_index :workdays, [:user_id]
  end
end
