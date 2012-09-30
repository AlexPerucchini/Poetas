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

end
