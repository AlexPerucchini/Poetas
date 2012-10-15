require 'spec_helper'

describe "Poems Pages" do
  
  
  subject { page }

  describe "non authenticated user" do
    before { visit(poems_path) }
    it { should have_selector('h1',    text: "Sign in") }
    it { should have_selector('title', text: "Poetas - Sign in") }
  end

  describe "authenticated user user" do
      let(:user) { FactoryGirl.create(:user) }
      before { sign_in(user) }

    describe "index page" do
      let!(:p1) { FactoryGirl.create(:poem, user: user, title: "Poem 1", body: "Lorem...") }
      let!(:p2) { FactoryGirl.create(:poem, user: user, title: "Poem 2", body: "Ipsum...") }

      before { visit(poems_path) }

      it { should have_selector('h1',    text: "Poems by #{user.name}") }
      it { should have_selector('title', text: "Poetas - #{user.name}") }
      it { should have_selector('h3', text: "Poems (#{user.poems.count})") }
      it { should have_link("Show") }

      describe "poems" do
        it { should have_content(p1.title) }
        it { should have_content(p2.title) }
        it { should have_content(p1.body) }
        it { should have_content(p2.body) }
        it { should have_content(user.poems.count) }
      end
    end

    describe "show page" do
      let!(:p1) { FactoryGirl.create(:poem, user: user, title: "Poem 1", body: "Lorem...") }
      before {  visit(poem_path(p1)) }

      it { should have_selector('span.title', text: p1.title) }
      it { should have_selector('title', text: "Poetas - #{p1.title}") }
      it { should have_content(p1.title) }
      it { should have_content(p1.body) }
    end
  end
 
end