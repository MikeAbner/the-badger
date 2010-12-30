class User
  include Mongoid::Document
  devise  :database_authenticatable, :registerable
  field   :admin, :type => Boolean, :default => false
  embeds_many :pins
  
  def username
    email.split('@')[0]
  end

  def type
    admin ? "admin" : "user"
  end
end
