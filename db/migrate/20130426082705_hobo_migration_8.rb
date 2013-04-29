class HoboMigration8 < ActiveRecord::Migration
  def self.up
    add_column :workdays, :project_id, :integer

    add_column :projects, :lead_responsible, :string

    add_index :workdays, [:project_id]
  end

  def self.down
    remove_column :workdays, :project_id

    remove_column :projects, :lead_responsible

    remove_index :workdays, :name => :index_workdays_on_project_id rescue ActiveRecord::StatementInvalid
  end
end
