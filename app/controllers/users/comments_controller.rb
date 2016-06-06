module Users
  class CommentsController < ApplicationController
    respond_to :json

    expose(:article, model: :article, finder_parameter: :article_id)
    expose(:comment, attributes: :comment_attributes)

    def create
      comment.user = current_user
      comment.article = article
      comment.save
      respond_with comment, location: -> { false }
    end

    private

    def comment_attributes
      params.require(:comment).permit(:text)
    end
  end
end
