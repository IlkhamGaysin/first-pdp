module Users
  class CommentsController < ApplicationController
    respond_to :json
    before_action :authorize_user!, only: %i(destroy)

    expose(:article, model: :article, finder_parameter: :article_id)
    expose(:comment, attributes: :comment_attributes)

    def create
      comment.user = current_user
      comment.article = article
      comment.save
      respond_with comment, location: -> { false }
    end

    def destroy
      comment.destroy
      respond_with comment, location: -> { false }
    end

    private

    def authorize_user!
      authorize comment, :own_object?
    end

    def comment_attributes
      params.require(:comment).permit(:text)
    end
  end
end
