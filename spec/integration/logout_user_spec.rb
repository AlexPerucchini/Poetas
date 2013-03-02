require "spec_helper"

feature "Authentication" do

 subject { page }

 context "logout user" do

  let!(:user) { FactoryGirl.create(:user) }
  before { sign_in(user) }

  describe "login out " do
    it { should have_selector('small',  text: "Signed in as #{user.name}.") }
    it { should have_link('Logout') }

    it "should logout user" do
      click_link('Logout')
      page.should have_content('Signed out successfully.')
      page.should have_link('Sign-in')
      page.should_not have_selector('small',  text: "Signed in as #{user.name}.")
    end
  end
 end
end
