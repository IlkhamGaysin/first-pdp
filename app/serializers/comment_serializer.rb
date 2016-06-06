class CommentSerializer < ActiveModel::Serializer
  attributes :id, :text, :author, :remove_url, :own_object

  def author
    object.decorate.author
  end

  def remove_url
    object.decorate.remove_url
  end

  def own_object
    object.decorate.own_object?
  end
end
