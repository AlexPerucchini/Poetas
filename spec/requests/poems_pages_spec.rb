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
      it { should have_selector('h3',    text: "Poems found (#{user.poems.count})") }
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
      it { should have_selector('title',      text: "Poetas - #{p1.title}") }
      it { should have_content(p1.title) }
      it { should have_content(p1.body) }
    end

    describe "new poem page" do

      before { visit new_poem_path }

      describe "with invalid information" do

        it "should not create a new poem" do
          expect { click_button("Create Poem") }.not_to change(Poem, :count)
        end

        describe "error messages" do
          before { click_button "Create Poem" }
          it { should have_content('errors') } 
        end
      end 

      describe "with valid information" do

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

      describe "with valid information" do
        pending "need to research test"
      end

      describe "with invalid information" do
        
        it "should not update a poem" do
          expect { click_button("Update Poem") }.not_to change(Poem, :count).by(1)
        end

        describe "error messages" do

          before do
            fill_in "Title",  with: " "
            fill_in "Poem",   with: " "
          end
          before { click_button "Update Poem" }
          it { should have_content('errors') } 
        end
      end
    end

    describe "delete poem" do
      
      let!(:p1) { FactoryGirl.create(:poem, user: user, title: "Poem 1", body: "Lorem...") }
      let!(:p2) { FactoryGirl.create(:poem, user: user, title: "Poem 2", body: "Ipsum...") }
      
      describe "as user on index page" do
        
        before { visit poems_path }
        
        it "should delete a poem " do
          expect { click_link("Delete") }.to change(Poem, :count).by(-1) 
        end
      end

      describe "as user on show page" do
        
        before { visit poem_path(p1) } 

        it "should delete a poem " do
          expect { click_link("Delete") }.to change(Poem, :count).by(-1) 
        end
      end
    end
  end
end