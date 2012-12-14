require "spec_helper"

describe "User Pages" do

  subject { page }

  describe "non authenticated user" do

    before { visit(poets_path) }
    it { should have_selector('h1',    text: "Sign in") }
    it { should have_selector('title', text: "Poetas - Sign in") }
  end

  describe "poets page for authenticated user" do

    let(:user) { FactoryGirl.create(:user) }
    let!(:p1) { FactoryGirl.create(:poem, user: user, title: "Poem 1", body: "Lorem...") }

    before do 
      sign_in(user) 
      visit(poets_path)
    end

    it { should have_selector('h1',    text: "Poets") }
    it { should have_selector('title', text: "Poetas - Poets") }

    it "should link to poets poem" do
      page.should have_link("Poems")
      click_link("Poems")
      page.should have_selector('h1', content: "Poems by #{user.name}") 
    end 
  end
  
  describe "profile page for authenticated user" do
    
    let(:user) { FactoryGirl.create(:user) }

    before(:each) do 
      visit(profile_path)
    end

    it { should have_selector('h1',     content: "#{user.name}'s Profile") }
    it { should have_selector('title',  content: "Poetas - Profile") }
    it { should have_selector('li',     content: "#{user.email}")}  
  end
end