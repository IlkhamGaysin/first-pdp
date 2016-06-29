$(document).on "ready page:load", ->
  $("[data-file-remove]").fileRemove()
  $("[data-file-preview]").filePreview()
