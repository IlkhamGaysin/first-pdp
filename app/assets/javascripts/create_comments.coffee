class CreateComments
  constructor: ->
    @inputFieldWrapper = @ui.commentField.parent('.input-group')
    @bindEvents()

  ui:
    commentField: $('.js-comment-content')
    addCommentLink: $('.js-create-comment-link')
    commentsList: $('.comments-list')
    errorConetainer: $('.js-error-container')

  bindEvents: ->
    @ui.addCommentLink.on 'click', =>
      @sendData()
      return false

    @ui.commentField.on 'keyup', (e) =>
      if e.keyCode == 13
        @sendData()

  sendData: =>
    @cleanErrors()

    $.ajax
      url: @addCommentUrl()
      dataType: "json"
      method: "POST"
      data:
        comment:
          text: @commentContent()
          article_id: @articleId()

      success: (response) =>
        @addComment(response)

      error: (response) =>
        @handleErrors(response)

  addComment: (response) =>
    comment = JST['comments/comment']({text: response.text})
    @ui.commentsList.append comment
    @ui.commentField.val ''

  handleErrors: (response)=>
    errors = response.responseJSON.text
    @addError(errors) if errors

  addError: (errors) =>
    error = JST['comments/error']({message: errors[0]})
    @ui.errorConetainer.html(error)
    @ui.commentField.parent('.input-group').addClass 'error'

  cleanErrors: =>
    @ui.errorConetainer.empty()
    @inputFieldWrapper.removeClass 'error'

  addCommentUrl: =>
    @ui.addCommentLink.data 'url'

  commentContent: =>
    @ui.commentField.val()

  articleId: =>
    @ui.addCommentLink.data 'article-id'

new CreateComments
