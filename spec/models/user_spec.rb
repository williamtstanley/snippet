require 'rails_helper'

RSpec.describe User, type: :model do
  describe "validations" do
    it "confirms that there is a first name" do
      u = build(:user, {first_name: nil})
      u.valid?
      expect(u.errors).to have_key(:first_name)
    end
    it "confirms that there is a last name" do
      u = build(:user, {last_name: nil})
      u.valid?
      expect(u.errors).to have_key(:last_name)
    end
    it "confirms that there is a valid email address" do
      u = build(:user, {email: "I am an invalid email address"})
      u.valid?
      expect(u.errors).to have_key(:email)
    end
    it "confirms that the email address is unique" do
      create(:user, {email: "duder@example.com"})
      u = build(:user, {email: "duder@example.com"})
      u.valid?
      expect(u.errors).to have_key(:email)
    end
  end
end
