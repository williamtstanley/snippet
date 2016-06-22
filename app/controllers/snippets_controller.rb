class SnippetsController < ApplicationController
  def new
    @snippet = Snippet.new
  end

  def create
    snippet = Snippet.new snippet_params
    if snippet.save
      redirect_to snippet_path(snippet)
    else
      render :new
    end
  end

  private

    def snippet_params
      params.require(:snippet).permit(:title, :work, :private)
    end
end
