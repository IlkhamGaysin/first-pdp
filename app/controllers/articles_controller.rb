class ArticlesController < ApplicationController
  expose_decorated(:articles) { |scope| wrap_with_paginator(scope) }
  expose_decorated(:article)

  expose_decorated(:comments, ancestor: :article) { |scope| scope.includes(:user) }
  expose(:comment) { article.comments.new }

  def index
  end

  def show
  end

  private

  def wrap_with_paginator(scope)
    scope.includes(:user).recent.page(params[:page])
  end
end
