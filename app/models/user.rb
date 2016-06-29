class User < ActiveRecord::Base
  has_secure_password

  validates :username, presence: true, uniqueness: true
  validates :first_name, :last_name, :email, presence: true
  validates :password, :length => { :within => 6..20 }, on: :create
  validate :valid_email

  def valid_email
   unless self.email =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
     errors.add(:email, "must be valid... please.")
   end
 end

end