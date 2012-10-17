class Poem < ActiveRecord::Base
  attr_accessible :body, :title

  belongs_to :user

  validates :body, :title, :user_id, presence: true

  default_scope order: 'poems.created_at DESC'

end
