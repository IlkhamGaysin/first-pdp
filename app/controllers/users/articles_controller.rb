module Users
  class ArticlesController < ApplicationController
    before_action :authorize_user!, only: %i(edit update)
    expose_decorated(:article, attributes: :article_attributes)
    expose(:comments, ancestor: :article)

    def new
    end

    def create
      article.user = current_user
      article.save
      respond_with article, location: -> { articles_path }
    end

    def show
    end

    def edit
    end

    def update
      article.save
      respond_with article
    end

    private

    def authorize_user!
      authorize article, :manage?
    end

    def article_attributes
      params.require(:article).permit(:title, :description)
    end
  end
end
