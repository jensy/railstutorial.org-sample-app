require 'spec_helper'

describe "User pages" do
  
  subject { page }

  describe  "signup page" do
    before { visit signup_path }

    it { should have_selector('h1', text: 'Sign up') }
    it { should have_selector('title', text: full_title('Sign up'))}
  end

  describe  "profile page" do
    before { visit user_path(user) }
    let(:user) { FactoryGirl.create(:user) }

    it { should have_selector('h1', text: user.name) }
    it { should have_selector('title', text: user.name) }
  end

  describe "sign up page" do
    before { visit signup_path }

    describe "with invalid information" do
      it "should not create a user" do
        old_count = User.count
        click_button "Create my account"
        new_count = User.count
        new_count.should == old_count
      end
    end

    describe "with valid information" do
      it "should create account" do
        old_count = User.count
        fill_in "Name", with: "Example User"
        fill_in "Email", with: "user@example.com"
        fill_in "Password", with: "foobar"
        fill_in "Confirmation", with: "foobar"
        click_button "Create my account"
        new_count = User.count
        new_count.should == old_count + 1
      end
    end
  end
 
end
