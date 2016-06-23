class SnippetsController < ApplicationController
  before_action :find_snippet, only: [:show, :edit, :update, :destroy]
  def new
    @snippet = Snippet.new
  end

  def create
    snippet = Snippet.new snippet_params
    user = current_user
    snippet.user = user
    if snippet.save
      redirect_to snippet_path(snippet)
    else
      render :new
    end
  end

  def show
  end

  def index
    if params[:mine]
      @snippets = Snippet.where(user: current_user).order(created_at: :desc)
    else
      @snippets = Snippet.order(created_at: :desc)
    end
  end

  def edit
  end

  def update
    if @snippet.update snippet_params
      redirect_to snippet_path(@snippet)
    else
      render :edit
    end
  end

  def destroy
    @snippet.destroy
    redirect_to snippets_path
  end

  private

    def snippet_params
      params.require(:snippet).permit(:title, :work, :private, :kind_id)
    end

    def find_snippet
      @snippet = Snippet.find params[:id]
    end
end
