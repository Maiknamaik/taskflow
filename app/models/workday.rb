class Workday < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    date_time :date
    n_day :integer
    timestamps
  end
  attr_accessible :n_day, :date_time, :workday

  # --- Relations --- #

  has_many :tasks, :dependent => :destroy

  belongs_to :owner_id, :class_name => "User", :creator => true

  children :tasks

  # --- Permissions --- #

  def create_permitted?
    acting_user.administrator?
  end

  def update_permitted?
    acting_user.administrator?
  end

  def destroy_permitted?
    acting_user.administrator?
  end

  def view_permitted?(field)
    acting_user.administrator?
  end

end
