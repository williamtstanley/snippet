require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe "#new" do
    before {get :new}
    it {expect(response).to render_template(:new)}
    it {expect(assigns(:user)).to be_a_new(User)}
  end

end
