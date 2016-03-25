module Users
  class ArticlesController < ApplicationController
    before_action :authenticate_user!

    expose(:article, attributes: :article_attributes)

    def new
    end

    def create
      self.article = Article.create!(article_attributes)
      respond_with article, location: -> { articles_path }
    end

    def edit
    end

    def update
    end

    private

    def article_attributes
      params.require(:article).permit(:title, :description)
    end
  end
end
