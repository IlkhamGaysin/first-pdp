class CommentDecorator < ApplicationDecorator
  delegate :id, :text, :author, :remove_url, :own_object?

  def author
    I18n.t("app.articles.author_prefix") + object.user.full_name
  end

  def remove_url
    h.comment_url(object)
  end

  def own_object?
    h.policy(object).own_object?
  end
end
