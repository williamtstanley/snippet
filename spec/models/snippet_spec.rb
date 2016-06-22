require 'rails_helper'

RSpec.describe Snippet, type: :model do
  describe "validations" do
    it "should have a title" do
      s = FactoryGirl.build(:snippet, {title: ''})
      s.valid?
      expect(s.errors).to have_key(:title)
    end

    it "should have a unique title" do
      FactoryGirl.create(:snippet, {title: 'not_original'})
      s = FactoryGirl.build(:snippet, {title: 'not_original'})
      s.valid?
      expect(s.errors).to have_key(:title)
    end

    it "should have work" do
      s = FactoryGirl.build(:snippet, {work: ''})
      s.valid?
      expect(s.errors).to have_key(:work)
    end
  end
end
