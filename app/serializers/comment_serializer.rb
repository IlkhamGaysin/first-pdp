class CommentSerializer < ActiveModel::Serializer
  attributes :id, :text, :author, :remove_url, :manage

  def author
    object.decorate.author
  end

  def remove_url
    object.decorate.remove_url
  end

  def manage
    object.decorate.manage?
  end
end
