require 'spec_helper'

describe "Static pages" do

  let(:base_title) { "Ruby on Rails Tutorial Sample App" }
  subject { page }

  describe "Home page" do

    before { visit root_path }

    it { should have_correct_h1_content('Sample App') }
    it { should_not have_selector('title',
                        :text => "| Home") }
    it { should have_selector('title',
                        :text => "#{ base_title }") }
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

    before { visit contact_path }

    it { should have_correct_h1_content('Contact') }
    it { should have_selector('title',
                    :text => "#{ base_title } | Contact") }
  end
end