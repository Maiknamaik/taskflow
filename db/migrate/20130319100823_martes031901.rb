class Martes031901 < ActiveRecord::Migration
  def self.up
    add_column :workdays, :user_id, :integer

    add_index :workdays, [:user_id]
  end

  def self.down
    remove_column :workdays, :user_id

    remove_index :workdays, :name => :index_workdays_on_user_id rescue ActiveRecord::StatementInvalid
  end
end
