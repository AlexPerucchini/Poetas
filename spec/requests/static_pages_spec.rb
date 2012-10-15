require 'spec_helper'

describe "StaticPages" do
 
  subject { page }

  it "should have the right links on the layout" do
    visit(root_path)
    click_link "About"
    page.should have_selector('title', text: 'Poetas - About')
    click_link "Contact"
    page.should have_selector('title', text: 'Poetas - Contact')
    click_link "Home"
    click_link "Sign up now!"
    page.should have_selector('h1', text: 'Sign up')
    click_link "Poetas"
    page.should have_selector('h1', text: "Welcome")
  end
 
  describe "home page" do

    before { visit(root_path) }

    it { should have_selector("title", text: "Poetas") }
    it { should have_selector('h1', text: "Welcome") }
    it { should_not have_selector("title", text: "Poetas - Home")}
    it { should have_link('Sign-in')}
    it { should_not have_link('Logout') }

  end

  describe "About page" do

    before { visit(about_path) }
   
    it { should have_selector("title", text: "Poetas - About") }
    it { should have_selector("h1", text: "About") }
  end

  describe "Contact page" do

    before { visit(contact_path) }
   
    it { should have_selector("title", text: "Poetas - Contact") }
    it { should have_selector("h1", text: "Contact") }
  end
end
