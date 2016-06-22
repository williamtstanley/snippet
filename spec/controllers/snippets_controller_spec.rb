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

  describe "#show" do
    let! (:snippet) {create(:snippet)}
    before {get :show, id: snippet.id}

    it "should instantiate a snippet variable according it id given" do
      expect(assigns(:snippet)).to eq(snippet)
    end

    it "should render the show template" do
      expect(response).to render_template(:show)
    end
  end

  describe "#index" do
    AMOUNT_OF_SNIPPETS = 3
    def create_snippet
      create(:snippet)
    end

    before { AMOUNT_OF_SNIPPETS.times{create_snippet}; get :index}

    it "should instantiate a variable that contains all the snippets" do
      expect(assigns(:snippets)).to eq(Snippet.order(created_at: :desc))
    end

    it "should render the index template" do
      expect(response).to render_template(:index)
    end
  end

  describe "#edit" do
    let! (:snippet) {create(:snippet)}
    before {get :edit, id: snippet.id}

    it "should render the edit template" do
      expect(response).to render_template(:edit)
    end

    it "should instantiate a varaible according to the id passed" do
      expect(assigns(:snippet)).to eq(snippet)
    end
  end

  describe "#update" do

    def snippet
      @snippet ||= Snippet.create attributes_for(:snippet)
    end

    context "with valid paramaters" do


      it "should update the post" do
        patch :update, id: snippet.id, snippet: {title: "new"}
        expect(Snippet.last.title).to eq("new")
      end

      it "should redirect to show post page" do
        patch :update, id: snippet.id, snippet: {title: "new"}
        expect(response).to redirect_to(snippet_path(snippet))
      end
    end

    context "with invalid paramaters" do
      it "should not update the post" do
        patch :update, id: snippet.id, snippet: {title: ""}
        expect(Snippet.last.title).to eq(snippet.title)
      end

      it "should render the edit template" do
        patch :update, id: snippet.id, snippet: {title: ""}
        expect(response).to render_template(:edit)
      end
    end
  end

  describe "#destroy" do
    let! (:snippet) {create(:snippet)}
    it "should destroy the snippet" do
      count_before = Snippet.count
      delete :destroy, id:snippet.id
      count_after = Snippet.count
      expect(count_before).to eq(count_after + 1 )
    end

    it "should redirect to the index page" do
      delete :destroy, id:snippet.id
      expect(response).to redirect_to(snippets_path)
    end
  end
end
