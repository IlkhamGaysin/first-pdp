class CommentDecorator < ApplicationDecorator
  delegate :id, :text
end
