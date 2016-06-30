class MainController < ApplicationController
  def index
    @kinds = Kind.all
    if current_user
      @feed = []
      current_user.following.each do |user|
         @feed << user.snippets
      end
      @feed.flatten!
    end
  end
end
