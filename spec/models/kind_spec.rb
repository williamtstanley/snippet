require 'rails_helper'

RSpec.describe Kind, type: :model do
  describe "validations" do
    it "should have a title" do
      k = build(:kind, {title: ''})
      k.valid?
      expect(k.errors).to have_key(:title)
    end
    it "should have a unique title" do
      create(:kind, {title: 'unoriginal'})
      k = build(:kind, {title: 'unoriginal'})
      k.valid?
      expect(k.errors).to have_key(:title)
    end
  end
end
