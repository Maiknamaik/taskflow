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
    acting_user.administrator? || workday.creatable_by?(acting_user)
  end

  def update_permitted?
    acting_user.administrator? || workday.updatable_by?(acting_user)
  end

  def destroy_permitted?
    acting_user.administrator? || workday.destroyable_by?(acting_user)
  end

  def view_permitted?(field)
    acting_user.administrator? || workday.destroyable_by?(acting_user)    
  end

end
