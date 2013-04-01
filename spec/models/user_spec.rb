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

require 'spec_helper'

describe User do

  before { @user = User.new(name: "Example User", email: "TestUser@test.com",
                            password: "foobar", password_confirmation: "foobar",
                            remember_me: false) }

  subject { @user }

  it { should respond_to(:email) }
  it { should respond_to(:name) }
  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }
  it { should respond_to(:remember_me) }
  it { should respond_to(:poems)}


  it { should be_valid }

  describe "when name is not present" do
    before { @user.name = " " }
    it { should_not be_valid }
  end

  describe "when email is not present" do
    before { @user.email = " "}
    it { should_not be_valid }
  end

  describe "when passord or password_confirmation is not present" do
    before { @user.password = @user.password_confirmation = " " }
    it { should_not be_valid }
  end

  describe "when name is too long " do
    before { @user.name = "a" * 51 }
    it { should_not be_valid }
  end

  describe "poems associations" do

    before { @user.save }

    let!(:older_poem) do
      FactoryGirl.create(:poem, user: @user, created_at: 1.day.ago)
    end

    let!(:newer_poem) do
      FactoryGirl.create(:poem, user: @user, created_at: 1.hour.ago)
    end

    it "should have the right poems in the right order" do
      @user.poems.should == [newer_poem, older_poem]
    end

    it "should not destroy associated poems" do
      #the user is logically (permanent record) deleted not physically deleted from the db
      poems = @user.poems.dup
      @user.destroy
      poems.should_not be_empty
      poems.each do |poem|
        Poem.find_by_id(poem.id).should_not be_nil
      end
    end
  end
end
