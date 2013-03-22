class Task < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    timestamps
    description :string
    utility :string
    resources :string
  end
  attr_accessible :description, :utility, :workday, :workday_id, :resources, :users

  # --- Relations --- #

  belongs_to :workday

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
