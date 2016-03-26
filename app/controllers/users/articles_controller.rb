module Users
  class ArticlesController < ApplicationController
    expose(:article, attributes: :article_attributes)

    def new
    end

    def create
      article.user = current_user
      article.save
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
