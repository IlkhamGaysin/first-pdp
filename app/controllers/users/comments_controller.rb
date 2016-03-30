module Users
  class CommentsController < ApplicationController
    respond_to :json

    expose(:article)

    def create
      context = CommentsCreator.call(comment_attributes)

      if context.success?
        render json: context.comment, root: false
      else
        render json: context.message, root: false, status: :unprocessable_entity
      end
    end

    private

    def comment_attributes
      params.require(:comment).permit(:text, :article_id)
    end
  end
end
