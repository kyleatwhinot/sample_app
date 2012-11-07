require 'spec_helper'

describe "Static pages" do

  let(:base_title) { "Ruby on Rails Tutorial Sample App" }
  subject { page }

  describe "Home page" do

    before { visit root_path }

    it { should have_correct_h1_content('TODAY') }
    it { should_not have_selector('title',
                        :text => "| Home") }
    it { should have_selector('title',
                        :text => "#{ base_title }") }

    describe "for signed in users" do
      let(:user) { FactoryGirl.create(:user) }
      before do 
        FactoryGirl.create(:micropost, user: user, content: "Lorem ipsum")
        FactoryGirl.create(:micropost, user: user, content: "dolor sit amet")
        sign_in user
        visit root_path
      end

      it { should have_correct_h1_content(user.name) }
      it { should have_content("microposts") }

      it "should have micropost feed" do
        user.feed.each do |item|
          page.should have_selector("li##{item.id}", text: item.content)
          page.should have_content("delete")
        end
      end

      describe "follower/following counts" do
        let(:other_user) { FactoryGirl.create(:user) }
        before do
          other_user.follow!(user)
          visit root_path
        end

        it { should have_link("0 following", href: following_user_path(user)) }
        it { should have_link("1 followers", href: followers_user_path(user)) }
      end
    end
  end

  describe "Help page" do

    before { visit help_path }

    it { should have_correct_h1_content('Help') }
    it { should have_selector('title',
                        :text => "#{ base_title } | Help")}
  end

  describe "About page" do

    before { visit about_path }

    it { should have_correct_h1_content('About Us') }
    it { should have_selector('title',
                    :text => "#{ base_title } | About Us") }
  end

  describe "Contact page" do

    before { visit contact_us_path }

    it { should have_correct_h1_content('Contact') }
    it { should have_selector('title',
                    :text => "#{ base_title } | Contact") }
  end
end