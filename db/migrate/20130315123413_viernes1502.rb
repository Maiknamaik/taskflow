class Viernes1502 < ActiveRecord::Migration
  def self.up
    add_column :workdays, :date, :date
    add_column :workdays, :n_day, :integer
  end

  def self.down
    remove_column :workdays, :date
    remove_column :workdays, :n_day
  end
end
