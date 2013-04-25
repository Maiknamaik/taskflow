class M < ActiveRecord::Migration
  def self.up
    add_column :projects, :project_name, :string
  end

  def self.down
    remove_column :projects, :project_name
  end
end
