# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  username        :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'rails_helper'

RSpec.describe User, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  describe "validations" do
    FactoryGirl.create(:user)

    it {should validate_presence_of :username}
    it {should validate_presence_of :password_digest}
    it {should validate_presence_of :session_token}

    it {should validate_uniqueness_of :username}
    it {should validate_uniqueness_of :password_digest}
    it {should validate_uniqueness_of :session_token}

    it {should validate_length_of :password}
  end

  describe "associations" do
    it {should have_many :goals}
    it {should have_many :comments}
  end

  context "methods" do
    # better way is making a user in spec_helper
    user = FactoryGirl.build(:user)

    describe "::find_by_credentials" do
      it "find a user by username and password" do
        user = FactoryGirl.create(:user,username: "rob", password: "123123")

        expect(User.find_by_credentials("rob", "123123")).to eq(user)
        expect(User.find_by_credentials("rob", "12312")).not_to eq(user)
      end
    end

    describe "#password=" do
      it "sets password_digest" do
        expect(user.password_digest).not_to be_nil
      end
    end

    describe "#is_password?" do
      it "checks if password is the right password" do
        user = FactoryGirl.build(:user, password: "123123")
        expect(user.is_password?("123123")).to be_truthy
      end
    end

    #next level
    describe "#ensure_session_token" do
      it "ensures a session token after initializing" do
        user = User.allocate
        expect(user).to receive(:ensure_session_token)
        user.send(:initialize)
      end
    end

    describe "#reset_session_token!" do
      it "resets session token" do
        session_token1 = user.session_token
        expect(user.reset_session_token!).not_to eq(session_token1)
      end
    end
  end
end
