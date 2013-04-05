class HoboMigration2 < ActiveRecord::Migration
  def self.up
    create_table :projects do |t|
      t.datetime :created_at
      t.datetime :updated_at
      t.date     :pro_date_ini
      t.date     :pro_date_end
    end
  end

  def self.down
    drop_table :projects
  end
end
