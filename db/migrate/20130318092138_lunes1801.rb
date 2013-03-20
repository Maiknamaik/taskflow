class Lunes1801 < ActiveRecord::Migration
  def self.up
    rename_column :workdays, :date, :date_time
  end

  def self.down
    rename_column :workdays, :date_time, :date
  end
end
