require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe "#new" do
    before {get :new}
    it {expect(response).to render_template(:new)}
    it {expect(assigns(:user)).to be_a_new(User)}
  end
  describe "#create" do
    context "with vaild request" do
      def valid_request
        post :create, user: attributes_for(:user)
      end
      it {expect {valid_request}.to change {User.count}.by(1)}
      it "redirects to the homepage" do
        valid_request
        expect(response).to redirect_to(root_path)
      end
      it "sets a session's usr_id to the created user id" do
        valid_request
        expect(session[:user_id]).to eq(User.last.id)
      end
  end
  context "with invalid request" do
      def invalid_request
        post :create, user: attributes_for(:user, {first_name: nil})
      end
      it {expect {invalid_request}.to change {User.count}.by(0)}
      it "renders the new template" do
        invalid_request
        expect(response).to render_template(:new)
      end
    end
end
end
