class Viernes1501 < ActiveRecord::Migration
  def self.up
    create_table :tasks do |t|
      t.datetime :created_at
      t.datetime :updated_at
      t.string   :description
      t.string   :utility
      t.string   :resources
      t.integer  :workday_id
    end
    add_index :tasks, [:workday_id]

    create_table :workdays do |t|
      t.datetime :created_at
      t.datetime :updated_at
    end
  end

  def self.down
    drop_table :tasks
    drop_table :workdays
  end
end
