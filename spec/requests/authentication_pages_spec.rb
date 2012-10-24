require "spec_helper"

describe "Authentication" do
  
  subject { page }

  describe "signin / logout  " do
    
    before { visit(signin_path) }
    it { should have_selector('h1',    text: "Sign in") }
    it { should have_selector('title', text: "Poetas - Sign in") }

    describe "with invalid information" do
      
      before { click_button("Sign in") }

      it { should have_selector('title', text: 'Sign in') }
      it { should have_selector('div.alert.alert-error', text: 'Invalid') }
    end

    describe "with valid information" do
      
      let(:user) { FactoryGirl.create(:user)  }

      before do
        visit(signin_path)
        fill_in "Email",    with: "#{user.email}"
        fill_in "Password", with: "#{user.password}"
        click_button("Sign in")
      end

      it { should have_selector('title',  text: "Poetas") }
      it { should have_selector('h1',     text: "Welcome") }
      it { should have_selector('small',  text: "Signed in as #{user.name}.") }
      it { should have_link('Logout') }

      it "should logout user" do
        click_link('Logout')
        page.should have_content('Signed out successfully.')
        page.should have_link('Sign-in')  
      end
    end
  end

  describe "singup page" do
    
    before { visit(signup_path) }

    let(:submit) { "Sign up" }

    describe "with invalid information" do

      it "should not create user" do
        expect { click_button submit }.not_to change(User, :count)
      end
    end

    describe "with valid information" do
     
      before do
        fill_in "Name",         with: "Example User"
        fill_in "Email",        with: "user@example.com"
        fill_in "Password",     with: "foobar"
        fill_in "Password confirmation", with: "foobar"
      end

      it "should create a user" do
        expect { click_button submit }.to change(User, :count).by(1)
      end
    end
  end
end