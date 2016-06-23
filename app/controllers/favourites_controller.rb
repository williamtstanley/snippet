class FavouritesController < ApplicationController

  def create
    snippet = Snippet.find params[:snippet_id]
    fav = Favourite.new(user: current_user, snippet: snippet)
    if fav.save
      redirect_to snippet_path(snippet)
    else
      redirect_to snippet_path(snippet)
    end
  end

  def destroy
    snippet = Snippet.find params[:snippet_id]
    fav = Favourite.find(params[:id])
    fav.destroy if can? :destroy, Favourite
    redirect_to snippet_path(snippet)
  end

  def index
    @snippets = current_user.favourite_snippets
  end
end
