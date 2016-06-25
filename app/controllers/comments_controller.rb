class CommentsController < ApplicationController

  def create
    comment = Comment.new comment_params
    snippet = Snippet.find params[:snippet_id]
    comment.user = current_user
    comment.snippet = snippet
    if comment.save
      redirect_to snippet_path(snippet), notice: "Comment created"
    else
      redirect_to snippet_path(snippet), alert: "Comment was not saved"
    end
  end

  def destroy
    comment = Comment.find params[:id]
    snippet = Snippet.find params[:snippet_id]
    comment.destroy
    redirect_to snippet_path(snippet), notice: "Comment destroyed"
  end

  private

    def comment_params
      params.require(:comment).permit(:body)
    end
end
