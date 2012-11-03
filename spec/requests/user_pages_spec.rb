require 'spec_helper'

describe "User pages" do

  let(:base_title) { "Ruby on Rails Tutorial Sample App" }
  subject { page }

  describe "signup" do

    before { visit signup_path }
    let(:submit) { "Create my account" }

    describe "with invalid information" do
      it "should not create a user" do
        expect { click_button submit }.not_to change(User, :count)
      end

      describe "after submission" do
        before { click_button submit }

        it { should have_selector('title', text: 'Sign up') }
        it { should have_content('error') }
      end
    end

    it { should have_selector('h1', :text => 'Sign up') }
    it { should have_selector('title',
                        :text => "#{ base_title } | Sign up") }

    describe "with valid information" do
      before do
        fill_in "Name",         with: "Example User"
        fill_in "Email",        with: "user@example.com"
        fill_in "Password",     with: "foobar"
        fill_in "Confirmation", with: "foobar"
      end

      it "should create a user" do
        expect { click_button submit }.to change(User, :count).by(1)
      end

      describe "after saving the user" do
      	before { click_button submit }

      	it { should have_link('Sign out') }

      end
    end
  end

  describe "Profile page" do
  	let(:user) { FactoryGirl.create(:user) }
  	before { visit user_path(user) }

  	it { should have_selector('h1', text: user.name) }
  	it { should have_selector('title', text: user.name)}
  end

  describe "edit" do
  	let(:user) { FactoryGirl.create(:user) }
    before do
    	sign_in user
    	visit edit_user_path(user) 
    end

    let(:submit) { "Save changes" }

    it { should have_selector('h1', :text => 'Update your profile') }
    it { should have_selector('title',
                        :text => "#{ base_title } | Edit user") }

    describe "with invalid information" do
      before { click_button submit }

      it { should have_content('error') }
    end

    describe "with valid information" do
      let(:new_name) 	{ "Example User" }
      let(:new_email) 	{ "user@example.com" }
      before do
        fill_in "Name",         with: new_name
        fill_in "Email",        with: new_email
        fill_in "Password",     with: user.password
        fill_in "Confirm password", with: user.password
      end

      describe "after updating the user" do
      	before { click_button "Save changes" }

      	it { should have_link('Sign out') }
      	it { should have_selector('h1', text: new_name) }
      	it { should have_selector('div.alert.alert-success') }
      	specify { user.reload.name.should == new_name }
      	specify { user.reload.email.should == new_email}
      end
    end
  end

end