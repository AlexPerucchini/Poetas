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

require 'spec_helper'

describe Poem do
  let(:user) { FactoryGirl.create(:user) }

  before { @poem = user.poems.build(title: "New Poem", 
    body: "Lorem ipsum, some text, some text...") }

  subject { @poem }

  it { should respond_to(:body) }
  it { should respond_to(:user_id) }
  it { should respond_to(:user) }
  its(:user) { should == user}

  it { should be_valid }

  describe "when user_id is not present" do
    before { @poem.user_id = nil}
    it { should_not be_valid }
  end

  describe "accessible attributes" do
    
    it "should not allow access to user_id" do
      expect do
        Poem.new(user_id: user.id)
      end.to raise_error(ActiveModel::MassAssignmentSecurity::Error)
    end    
  end

  describe "with blank title" do
    before { @poem.title = " " }
    it { should_not be_valid }
  end

  describe "with blank body" do
    before { @poem.body = " " }
    it { should_not be_valid }
  end
end
