# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0)
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  name                   :string(255)
#  deleted_at             :datetime
#

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
  has_many :poems, dependent: :destroy
  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true


  #After authenticating a user and in each request, Devise checks if your model
  #is active by calling model.active_for_authentication?. This method is
  #overwritten by other devise modules.
  def active_for_authentication?
    #the deleted? method is part of the permanent_record
    super && !deleted?
  end

  def self.text_search(query)
    if query.present?
      #using texticle
      search(query)
    else
      scoped
    end
  end

  #need to keep track of voting
  has_many :evaluations, class_name: "ReputationSystem::Evaluation", as: :source
  def voted_for?(poem)
    evaluations.where(target_type: poem.class, target_id: poem.id).present?
  end
end
