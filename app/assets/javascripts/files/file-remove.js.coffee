(($) ->
  class FileRemove
    constructor: (element) ->
      @dataKey = "file-remove"
      @options = element.data(@dataKey)
      @element = element
      @_bind()

    _bind: ->
      $("body").on "click", "[data-" + @dataKey + "]", (e) =>
        e.preventDefault()
        @_remove()

      $("body")
        .on "remove-#{@options.selector}:reset", "[data-#{@dataKey}]", (e) =>
          @element.removeClass("hidden")
          @_reset()

    _remove: =>
      $("#" + @options.selector).attr("src", @options.default)
      $("#" + @options.hidden).prop("checked", true)
      $("#" + @options.file_input).val("")
      @element.addClass("hidden")

    _reset: =>
      $("#" + @options.hidden).val(false)

  $.fn.fileRemove = ->
    return unless @length
    new FileRemove(this)

) jQuery
