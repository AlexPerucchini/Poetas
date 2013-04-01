require 'spec_helper'

feature "Poems Pages" do

  subject { page }

  context "has non authenticated user" do

    describe "should not access poems page" do
      before { visit(poems_path) }
      it { should have_selector('h1',    text: "Sign in") }
      it { should have_selector('title', text: "Poetas - Sign in") }
   end
  end

  context "has authenticated user" do

      let!(:user) { FactoryGirl.create(:user) }
      before { sign_in(user) }

    describe "should access the poems index page" do
      let!(:p1) { FactoryGirl.create(:poem, user: user, title: "Poem 1", body: "Lorem...") }
      let!(:p2) { FactoryGirl.create(:poem, user: user, title: "Poem 2", body: "Ipsum...") }
      before { visit(poems_path) }
      it { should have_selector('h1',    text: "Poems by #{user.name}") }
      it { should have_selector('title', text: "Poetas - #{user.name}") }
      it { should have_selector('h3',    text: "Poems found (#{user.poems.count})") }
      it { should have_link("Show") }
      describe "should have poems " do
        it { should have_content(p1.title) }
        it { should have_content(p2.title) }
        it { should have_content(p1.body) }
        it { should have_content(p2.body) }
        it { should have_content(user.poems.count) }
      end
    end

    describe "should show poems " do
      let!(:p1) { FactoryGirl.create(:poem, user: user, title: "Poem 1", body: "Lorem...") }
      before {  visit(poem_path(p1)) }
      it { should have_selector('h3', content: p1.title) }
      it { should have_selector('title',      content: "Poetas - #{p1.title}") }
      it { should have_content(p1.title) }
      it { should have_content(p1.body) }
    end

    context  "new poem" do

      before { visit new_poem_path }

      describe "should not create a poem with invalid information" do
        it "should not create a new poem" do
          expect { click_button("Create Poem") }.not_to change(Poem, :count)
        end

        describe "error messages" do
          before { click_button "Create Poem" }
          it { should have_content('errors') }
        end
      end

      describe "should create with valid information" do
        before do
          fill_in "Title",  with: "Poem 1"
          fill_in "Poem",   with: "Ipso Lorem..."
        end
        it "should create a new poem" do
          expect { click_button("Create Poem") }.to change(Poem, :count).by(1)
        end
      end
    end

    describe "update poem" do
      let!(:p1) { FactoryGirl.create(:poem, user: user, title: "Poem 1", body: "Lorem...") }
      before { visit edit_poem_path(p1) }
      it { should have_selector('h1', text: "Edit Poem") }
      it { should have_selector('title', text: 'Poetas - Edit Poem')}

      describe "should not update a poem invalid information" do
        it "should not update a poem" do
          expect { click_button("Update Poem") }.not_to change(Poem, :count).by(1)
        end

        describe "error messages" do
          before do
            fill_in "Title",  with: " "
            fill_in "Poem",   with: " "
            click_button "Update Poem"
          end
          it { should have_content('errors') }
        end
      end
    end

    context "delete a poem" do

      let!(:p1) { FactoryGirl.create(:poem, user: user, title: "Poem 1", body: "Lorem...") }
      let!(:p2) { FactoryGirl.create(:poem, user: user, title: "Poem 2", body: "Ipsum...") }

      describe "on poems index page" do
        before { visit poems_path }
        it { should have_content("Delete Poem") }
        pending("make this test pass ")
      end

      describe "on poems show page" do
        before { visit poem_path(p1) }
        it { should have_content("Delete Poem") }
        pending("make this test pass ")
      end
    end
  end
end
