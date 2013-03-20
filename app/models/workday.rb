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

  belongs_to :owner, :class_name => "User" :creator => true

  children :tasks

  # --- Permissions --- #

  def create_permitted?
    acting_user.administrator? || acting_user.signed_up?
  end

  def update_permitted?
    acting_user.administrator? || (owner_is?(acting_user) && !owner_changed?)
  end

  def destroy_permitted?
    acting_user.administrator? || owner_is?(acting_user)
  end

  def view_permitted?(field)
    owner_is? acting_user
  end

end
