class Task < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    timestamps
    description :text
    utility :text
    resources :text
  end

  # --- Relations --- #

  belongs_to :workday

  # --- Permissions --- #

  def create_permitted?
    acting_user.administrator? || acting_user.signed_up?
  end

  def update_permitted?
    acting_user.administrator? || (acting_user == self.workday.owner && only_changed?(:description, :utility, :resources))
    true
  end

  def destroy_permitted?
    acting_user.administrator? || (acting_user == self.workday.owner)
  end

  def view_permitted?(field)
    acting_user.administrator? || (acting_user == self.workday.owner)
    true
  end

end
