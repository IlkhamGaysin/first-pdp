class ArticleDecorator < ApplicationDecorator
  delegate :id, :title, :description, :author, :new_record?

  def author
    I18n.t("app.articles.author_prefix") + object.user.full_name
  end
end
