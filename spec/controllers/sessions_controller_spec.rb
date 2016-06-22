require 'rails_helper'

RSpec.describe SessionsController, type: :controller do

  describe "#new" do
    it "renders the new template" do
      get :new
      expect(response).to render_template(:new)
    end
  end
  # describe "#create" do
  #   context "with valid attributes" do
  #     def valid_request
  #       create(:user, {password: "password"})
  #     end
  #     it "signs the use in creating a session variable"
  #     it "redirects to the root_path"
  #   end
  #   context "with invalid attributes" do
  #
  #   end
  # end
  # describe "#destroy" do
  #
  # end

end
