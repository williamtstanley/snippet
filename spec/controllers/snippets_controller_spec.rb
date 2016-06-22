require 'rails_helper'

RSpec.describe SnippetsController, type: :controller do
  describe "#new" do
    before {get :new}

    it "should render the new template" do
      expect(response).to render_template(:new)
    end

    it "should instantiate a variable equal to a new snippet" do
      expect(assigns(:snippet)).to be_a_new(Snippet)
    end
  end

  describe "#create" do
    context "with valid paramaters" do
      def valid_request
        post :create, snippet: (attributes_for(:snippet))
      end

      it "should add a new snippet to the database" do
        count_before = Snippet.count
        valid_request
        count_after = Snippet.count
        expect(count_after).to eq(count_before + 1)
      end

      it "should redirect to show snippet page" do
        valid_request
        expect(response).to redirect_to(snippet_path(Snippet.last))
      end
    end

    context "with invalid paramaters" do
      def invalid_request
        post :create, snippet: (attributes_for(:snippet, title: ''))
      end

      it "should not add a snippet to the database" do
        count_before = Snippet.count
        invalid_request
        count_after = Snippet.count
        expect(count_after).to eq(count_before)
      end

      it "should render the new template" do
        invalid_request
        expect(response).to render_template(:new)
      end
    end
  end

end
