require 'spec_helper'

describe "AuthenticationPages" do
	
	subject { page }
	let (:submit) { "Sign in" }


	describe "sign in page" do
		before { visit signin_path }

		it { should have_selector('h1', text: "Sign in") }
		it { should have_selector('title', text: "Sign in") }
	
		describe "with invalid information" do
			before { click_button :submit }

			it { should have_selector('div.alert.alert-error', text: "Invalid") }

			describe "after visiting another page" do
  				before { click_link "Home" }
  				
  				it { should_not have_selector('div.alert.alert-error') }
			end
		end

		describe "with valid information" do
		let(:user) { FactoryGirl.create(:user) }

			before do
				fill_in "Email", 	with: user.email
				fill_in "Password",	with: user.password
				click_button :submit
			end

			it { should have_selector('title', text: user.name) }
			it { should have_link('Profile', href: user_path(user)) }
			it { should have_link('Settings', href: edit_user_path(user)) }
			it { should have_link('Sign out', href: signout_path) }
			it { should_not have_content('Sign in') }

			describe "followed by signout" do
				before { click_link "Sign out" }
				it { should have_link("Sign in") }
			end
		end

		describe "before signed in" do
		let(:user) { FactoryGirl.create(:user) }

			describe "visit unauthorized user page" do
				before { visit edit_user_path(user) }
				it { should have_selector('h1', text:"Sign in") }
			end

			describe "redirect to sign in page" do
				before { put user_path(user) }
				specify { response.should redirect_to(signin_path) }
			end
		end

		describe "as wrong user" do
		let(:user) { FactoryGirl.create(:user) }
		let(:wronguser) { FactoryGirl.create(:user, email: "wrongemail@example.com") }
		before { sign_in user }

			describe "visiting other users edit page" do
				before { visit edit_user_path(wronguser) }
				it { should_not have_selector('h1', text: "Edit profile") }
			end

			describe "visiting other users edit page in the browser" do
				before { put user_path(wronguser) }
				specify { response.should redirect_to(root_path) }
			end
		end

	end
end
