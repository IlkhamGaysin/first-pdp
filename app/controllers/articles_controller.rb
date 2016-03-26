class ArticlesController < ApplicationController
  expose_decorated(:articles) { |scope| scope.includes(:user) }

  def index
  end
end
