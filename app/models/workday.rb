class Workday < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    date_time :date
    timestamps
  end

  # --- Relations --- #

  has_many :tasks
  belongs_to :owner, :class_name => "User", :creator => true

  children :tasks

  # --- Permissions --- #

  def create_permitted?
    acting_user.administrator? || acting_user.signed_up?
  end

  def update_permitted?
    acting_user.administrator? || (acting_user == self.owner && only_changed?(:date_time))
  end

  def destroy_permitted?
    acting_user.administrator?
  end

  def view_permitted?(field)
    acting_user.administrator? || (acting_user == self.owner)
  end

end
