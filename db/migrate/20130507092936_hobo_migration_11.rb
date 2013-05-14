class HoboMigration11 < ActiveRecord::Migration
  def self.up
    add_column :users, :surname, :string
    add_column :users, :lastname, :string
    add_column :users, :dni, :string
    add_column :users, :phone, :string
    add_column :users, :address, :string
    add_column :users, :teacher, :boolean
    add_column :users, :birthday, :date
    add_column :users, :centre, :string
    add_column :users, :departament, :string
    add_column :users, :grade, :string
  end

  def self.down
    remove_column :users, :surname
    remove_column :users, :lastname
    remove_column :users, :dni
    remove_column :users, :phone
    remove_column :users, :address
    remove_column :users, :teacher
    remove_column :users, :birthday
    remove_column :users, :centre
    remove_column :users, :departament
    remove_column :users, :grade
  end
end
