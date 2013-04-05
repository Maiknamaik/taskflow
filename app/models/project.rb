class Project < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    timestamps
    pro_date_ini :date
    pro_date_end :date
  end

  # --- Relations --- #

  has_many :users, :through => :project_users
  has_many :project_users
  
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
    true
  end

end
