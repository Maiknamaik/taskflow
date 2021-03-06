class User < ActiveRecord::Base

  hobo_user_model # Don't put anything above this

  fields do
    name          :string, :required
    surname       :string, :required
    lastname      :string, :required
    dni           :string, :required
    phone         :string
    email_address :email_address, :unique, :login => true
    address       :string
    teacher       :boolean, :default => false
    birthday      :date
    centre        :string
    departament   :string
    grade         :string
    administrator :boolean, :default => false
    timestamps
  end

  # --- Relations --- #

  has_many :workdays, :class_name => "Workday", :foreign_key => "owner_id"
  belongs_to :project
  
  # This gives admin rights and an :active state to the first sign-up.
  # Just remove it if you don't want that
  before_create do |user|
    if !Rails.env.test? && user.class.count == 0
      user.administrator = true
      user.state = "active"
    end
  end


  # --- Signup lifecycle --- #

  lifecycle do

    state :active, :default => true

    create :signup, :available_to => "Guest",
           :params => [:name, :surname,:lastname,:dni,:email_address,:teacher,:password, :password_confirmation],
           :become => :active

    transition :request_password_reset, { :active => :active }, :new_key => true do
      UserMailer.forgot_password(self, lifecycle.key).deliver
    end

    transition :reset_password, { :active => :active }, :available_to => :key_holder, :params => [ :password, :password_confirmation ]

  end

  # --- Permissions --- #

  def create_permitted?
    # Only the initial admin user can be created
    # self.class.count == 0
    # acting_user.administrator?
    true
  end

  def update_permitted?
    acting_user.administrator? || (acting_user == self && only_changed?(:name, :surname,:lastname, :lastname, :dni, :phone, :address, :birthday, :centre, :departament, :grade, :email_address, :crypted_password,:current_password, :password, :password_confirmation))
    # Note: crypted_password has attr_protected so although it is permitted to change, it cannot be changed
    # directly from a form submission.
  end

  def destroy_permitted?
    acting_user.administrator? || acting_user == self
  end

  def view_permitted?(field)
    acting_user.administrator? || acting_user == self || new_record?
  end
end
