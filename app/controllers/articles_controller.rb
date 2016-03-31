class ArticlesController < ApplicationController
  expose_decorated(:articles) { |scope| scope.includes(:user) }

  def index
    wrap_with_paginator
  end

  private

  def wrap_with_paginator
    self.articles = articles.recent.page(params[:page])
  end
end
