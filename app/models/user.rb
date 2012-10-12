class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable, :recoverable, 
  devise :database_authenticatable, :registerable,
         :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible  :name, :email, :password, :password_confirmation, 
                   :remember_me
  # attr_accessible :title, :body

  has_many :poems
  
  validates :name, presence: true, length: { maximum: 50}
  validates :email, presence: true
end
