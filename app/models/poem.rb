# == Schema Information
#
# Table name: poems
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  body       :text
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  deleted_at :datetime
#

class Poem < ActiveRecord::Base
  attr_accessible :body, :title
  belongs_to :user
  validates :body, :title, :user_id, presence: true
  default_scope order: 'poems.created_at DESC'
  #reputions system
  has_reputation :votes, source: :user, aggregate_by: :sum
end
