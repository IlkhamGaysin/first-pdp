class CommentsCreator
  include Interactor

  def call
    article = Article.find(context.article_id)
    comment = Comment.create(article: article, text: context.text)

    if comment.valid?
      context.comment = comment
    else
      context.fail!(message: comment.errors.messages)
    end
  end
end
