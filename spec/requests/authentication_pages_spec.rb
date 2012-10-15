require "spec_helper"

describe "Authentication" do
  
  subject { page }

  describe "sign in " do
    before { visit(signin_path) }

    it { should have_selector('h1', text: "Sign in") }
    it { should have_selector('title', text: "Poetas - Sign in") }

    describe "with invalid information" do
      
      before { click_button("Sign in")}

      it { should have_selector('title', text: 'Sign in') }
      it { should have_selector('div.alert.alert-error', text: 'Invalid') }
    end

    describe "with valid information" do
      
    end
  end
end