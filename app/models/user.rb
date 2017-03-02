class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  attr_accessor :login

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable,
         :authentication_keys => {email:true, login: false}
         
  has_many :posts
  validates :user_name,:presence => true, :uniqueness => {:case_sensitive => false }
  validates_format_of :user_name, with: /^[a-zA-Z0-9_\.]*$/, :multiline => true

  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["lower(user_name) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    else
      if conditions[:user_name].nil?
        where(conditions).first
      else
        where(user_name: conditions[:user_name]).first
      end
    end
  end

end
