class MainController < ApplicationController
  def index
    @kinds = Kind.all
  end
end
