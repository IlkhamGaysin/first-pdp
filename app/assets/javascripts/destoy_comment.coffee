class DestroyComment
  constructor: ->
    @bindEvents()

  ui:
    removeCommentLink: '.js-remove-comment-link'
    commentsList: $('.comments-list')

  bindEvents: ->
    $(document).on 'click', @ui.removeCommentLink, (e) =>
      @remove(e)
      return false

  remove: (e) =>
    commentId = @commentId(e)

    if commentId
      $.ajax
        url: @removeCommentUrl(e)
        dataType: "json"
        method: "DELETE"
        data:
          id: commentId
        success: (response) =>
          @removeComment(commentId)

  removeComment: (commentId) =>
    @ui.commentsList.find('#comment_' + commentId).remove()

  removeCommentUrl: (e) ->
    $(e.target).data 'remove-url'

  commentId: (e) ->
    id = $(e.target).closest('.comment-box').attr('id')
    id.replace('comment_', '')

new DestroyComment
