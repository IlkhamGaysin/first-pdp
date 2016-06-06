class CommentSerializer < ActiveModel::Serializer
  attributes :id, :text, :author

  def author
    object.decorate.author
  end
end
