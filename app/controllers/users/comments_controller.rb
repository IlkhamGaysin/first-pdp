module Users
  class CommentsController < BaseController
    before_action :authorize_user!, only: %i(destroy)

    expose_decorated(:article)
    expose_decorated(:comments) { Comment.by_article(article).includes(:user) }
    expose(:comment, attributes: :comment_attributes)

    def create
      comment.user = current_user
      self.comment = article.comments.new if comment.save
      render "articles/fragments"
    end

    def destroy
      comment.destroy
      respond_with comment, location: article_path(article)
    end

    private

    def authorize_user!
      authorize comment, :manage?
    end

    def comment_attributes
      params.require(:comment).permit(:text)
    end
  end
end
